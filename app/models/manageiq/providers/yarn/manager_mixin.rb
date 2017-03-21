module ManageIQ::Providers::Yarn::ManagerMixin
  extend ActiveSupport::Concern

  def verify_credentials(auth_type = nil, options = {})
    begin
      options[:auth_type] = auth_type

      connection = connect(options)

      # Not all errors will cause Fog to raise an exception,
      # for example an error in the google_project id will
      # succeed to connect but the first API call will raise
      # an exception, so make a simple call to the API to
      # confirm everything is working
    rescue => err
      raise MiqException::MiqInvalidCredentialsError, err.message
    end

    true
  end

  def connect(options = {})
    require 'fog/hadoop'

    raise "no credentials defined" if missing_credentials?(options[:auth_type])

    server   = options[:host] || address
    port     = options[:port] || self.port

    self.class.raw_connect(server, port, options)
  end

  module ClassMethods
    def raw_connect(server, port, options)
      params = {
          :hadoop_compute_api_url => "http://#{server}:#{port}/"
      }
      case options[:service]
      when 'yarn', nil
        ::Fog::Compute::Hadoop.new(params)
      else
        raise  ArgumentError, "Unknown service: #{options[:service]}"
      end
    end
  end
end
