module ManageIQ
  module Providers
    module Yarn
      class Engine < ::Rails::Engine
        isolate_namespace ManageIQ::Providers::Yarn
      end
    end
  end
end
