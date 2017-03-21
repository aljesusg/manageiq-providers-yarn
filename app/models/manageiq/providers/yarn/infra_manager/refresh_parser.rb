module ManageIQ::Providers::Yarn
  class InfraManager::RefreshParser < EmsRefresh::Parsers::Infra
    def initialize(ems, options = nil)
        @ems        = ems
        @connection = ems.connect(options)
        @options    = options || {}
    end

    private


    def get_node_managers
      cabinets = @connection.list_nodes
    end

    def parse_node_manager(node)
      new_result = {
        :type          => ManageIQ::Providers::Yarn::InfraManager::NodeManager.name,
        :name          => node.name,
        :ems_ref       => node.uuid,
        :uid_ems       => @ems.uid_ems,
        :hostname      => node.hostname,
        :product_name  => node.productName,
        :manufacturer  => node.manufacturer,
        :machine_type  => node.machineType,
        :model         => node.model,
        :serial_number => node.serialNumber,
        :uuid          => node.uuid,
        :FRU           => node.FRU,
        :macAddresses  => node.macAddress.split(",").flatten,
        :ipv4Addresses => node.ipv4Addresses.split.flatten,
        :ipv6Addresses => node.ipv6Addresses.split.flatten
      }

      {"rack"=>"/default-rack", "state"=>"RUNNING", "id"=>"lpcwf473.internal:8041", "nodeHostName"=>"lpcwf473.internal", "nodeHTTPAddress"=>"lpcwf473.internal:8042", "lastHealthUpdate"=>1490108841368, "version"=>"2.6.0-cdh5.8.3", "healthReport"=>"", "numContainers"=>18, "usedMemoryMB"=>48128, "availMemoryMB"=>1024, "usedVirtualCores"=>18, "availableVirtualCores"=>6}

      return node.uuid, new_result
    end
  end
end
