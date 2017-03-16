require 'fog/hadoop'
module ManageIQ::Providers::Yarn::ManagerAuthMixin
  extend ActiveSupport::Concern

  def verify_credentials(auth_type = nil, options = {})
    auth_type ||= 'default'
    raise MiqException::MiqHostError, "No credentials defined" if missing_credentials?(auth_type)

    options[:auth_type] = auth_type
    begin
      case auth_type.to_s
        when 'default' then
          with_provider_connection(options) do |vcd|
            vcd.organizations.all
          end
        else
          raise "Invalid Yarn Authentication Type: #{auth_type.inspect}"
      end
    rescue => err
      miq_exception = translate_exception(err)
      _log.error("Error Class=#{err.class.name}, Message=#{err.message}")
      raise miq_exception
    end

    true
  end

  def connect(options = {})
    raise "no credentials defined" if missing_credentials?(options[:auth_type])

    server   = options[:ip] || address
    port     = options[:port] || self.port

    self.class.raw_connect(server, port)
  end

  def translate_exception(err)
    case err
      when Excon::Errors::Timeout
        MiqException::MiqUnreachableError.new "Timed out"
      when Excon::Errors::SocketError
        MiqException::MiqHostError.new "Socket error: #{err.message}"
      when MiqException::MiqInvalidCredentialsError, MiqException::MiqHostError
        err
      else
        MiqException::MiqHostError.new "Unexpected response returned from system: #{err.message}"
    end
  end

  module ClassMethods
    def raw_connect(server, port)
      params = {
          :hadoop_compute_api_url => "http://#{server}:#{port}/"
      }

      Fog::Compute::Hadoop.new(params)
    end
  end
end