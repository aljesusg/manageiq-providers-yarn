module ManageIQ::Providers
  module Yarn
    module InfraManager::RefreshParser

      def self.initialize(ems, options = nil)
        ems_auth = ems.authentications.first
        @ems        = ems
        @connection = ems.connect({:host => ems.endpoints.first.hostname,
                                   :port => 8088})
        @options    = options || {}
        @data       = {}
      end

      def self.ems_inv_to_hashes(ems, options = nil)
        self.initialize(ems,options)

        log_header = "MIQ(#{self.class.name}.#{__method__}) Collecting data for EMS name: [#{@ems.name}] id: [#{@ems.id}]"
        $log.info("#{log_header}...")

        get_node_managers

        $log.info("#{log_header}...Complete")

        @data
      end

      private

      def get_node_managers
        nodes = @connection.list_nodes
        puts nodes.inspect
        #process_collection(@connection.list_nodes, :hosts){ |n| parse_node_manager(n)}
      end

      # Parsing

      def parse_node_manager(node)
        uid = node["id"]
        new_result = {
            :name          => node["id"],
            :hostname      => node["nodeHostName"],
        }
        return uid,new_result
      end
    end
  end
end
