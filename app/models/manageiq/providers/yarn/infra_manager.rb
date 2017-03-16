module ManageIQ::Providers
  class Yarn::InfraManager < InfraManager

    def self.ems_type
      @ems_type ||= "yarns".freeze
    end

    def self.description
      @description ||= "Hadoop Yarn".freeze
    end

    def verify_credentials(auth_type = nil, _options = {})
      raise "no credentials defined" if self.missing_credentials?(auth_type)
      begin
        with_provider_connection(:use_broker => false, :auth_type => auth_type) {}
      rescue SocketError, Errno::EHOSTUNREACH, Errno::ENETUNREACH
        _log.warn($!.inspect)
        raise MiqException::MiqUnreachableError, $!.message
      rescue Exception
        _log.warn($!.inspect)
        raise "Unexpected response returned from #{ui_lookup(:table => "ext_management_systems")}, see log for details"
      end
      true
    end

    def get_nodes

    end
  end
end
