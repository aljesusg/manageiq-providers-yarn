FactoryGirl.define do
  factory :ems_yarn,
          :aliases => ["manageiq/providers/yarn/infra_manager"],
          :class   => "ManageIQ::Providers::Yarn::InfraManager",
          :parent  => :ems_infra do
  end
end