module ManageIQ::Providers
  module Yarn
    class InfraManager::Refresher < ManageIQ::Providers::BaseManager::Refresher
      include EmsRefresh::Refreshers::EmsRefresherMixin

      def self.parse_legacy_inventory(ems)

        log_header = "MIQ_HADOOP_YARN_(#{self.class.name}.#{__method__} Calling for [#{ems.name}])"
        $log.info("#{log_header}")
        ManageIQ::Providers::Yarn::InfraManager::RefreshParser.ems_inv_to_hashes(ems)
      end

      def save_inventory(ems, target, hashes)
        EmsRefresh.save_ems_inventory(ems, hashes)
      end

    end
  end
end
