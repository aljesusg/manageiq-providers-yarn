describe ManageIQ::Providers::Yarn::InfraManager do

  before :all do
    @host = 'yarn_host'
    host_uri = URI.parse("https://#{@host}")

    @hostname = host_uri.port
    @port = host_uri.port == 8088 ? nil : host_uri.port

    _guid, _server, zone = EvmSpecHelper.create_guid_miq_server_zone
    @ems = FactoryGirl.create(
        :ems_yarn,
        :zone     => zone,
        :hostname => @hostname,
        :port     => @port
    )
  end

  it ".ems_type" do
    expect(described_class.ems_type).to eq('yarns')
  end

  it ".description" do
    expect(described_class.description).to eq('Hadoop Yarn')
  end

  it "will verify credentials" do
      expect(@ems.verify_credentials).to eq(true)
    end
  end
end