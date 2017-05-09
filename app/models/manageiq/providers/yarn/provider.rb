class ManageIQ::Providers::Consumption::Provider < ::Provider
  has_one :ph_infra_manager,
          :foreign_key  =>  "provider_id",
          :class_name   =>  "ManageIQ::Providers::Consumption::InfraManager",
          :autosave     => true

  validates   :name, :presence => true, :uniqueness =>  true

end
