class ManageIQ::Providers::Yarn::InfraManager::RefreshWorker < ::MiqEmsRefreshWorker
  require_nested :Runner

  def self.ems_class
    ManageIQ::Providers::Yarn::InfraManager
  end

  def self.settings_name
    :ems_refresh_worker_yarn_infra
  end

end
