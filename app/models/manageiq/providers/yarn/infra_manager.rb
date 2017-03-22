module ManageIQ::Providers
  class Yarn::InfraManager < InfraManager

    require_nested :Refresher
    require_nested :RefreshParser
    require_nested :RefreshWorker

    include ManageIQ::Providers::Yarn::ManagerMixin

    def self.ems_type
      @ems_type ||= "yarns".freeze
    end

    def self.description
      @description ||= "Hadoop Yarn".freeze
    end
  end
end
