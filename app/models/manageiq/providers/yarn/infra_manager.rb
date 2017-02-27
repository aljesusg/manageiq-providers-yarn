module ManageIQ::Providers
  class Yarn::InfraManager < InfraManager

    def self.ems_type
      @ems_type ||= "yarns".freeze
    end

    def self.description
      @description ||= "Hadoop Yarn".freeze
    end
  end
end
