module ManageIQ::Providers
  class Yarn::InfraManager < InfraManager
    has_many :physical_servers, :foreign_key => "ems_id", :class_name => "ManageIQ::Providers::Yarn::InfraManager::NodeManager"

    require_nested :Refresher
    require_nested :RefreshParser
    require_nested :RefreshWorker

    include ManageIQ::Providers::Yarn::ManagerMixin

    def self.ems_type
      @ems_type ||= "yarn_infra".freeze
    end

    def self.description
      @description ||= "Hadoop Yarn".freeze
    end
  end
end
