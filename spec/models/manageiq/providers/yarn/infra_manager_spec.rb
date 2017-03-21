describe ManageIQ::Providers::Yarn::InfraManager do
  it ".ems_type" do
    expect(described_class.ems_type).to eq('yarns')
  end

  it ".description" do
    expect(described_class.description).to eq('Hadoop Yarn')
  end

  context "#connectivity" do
    before do
      @server = "yarn_hadoop"
      @port = 8088
      @e = FactoryGirl.create(:ems_yarn)
    end
    it "Fog::Compute:Haddop receive new" do
      require 'fog/hadoop'
        expect(Fog::Compute::Hadoop).to receive(:new) do |options|
          expect(options[:hadoop_compute_api_url].to_s)
            .to eq("http://yarn_hadoop:8088/")
        end
        @e.connect({:host => @server, :port =>@port})
    end

    it "Fog::Compute:Haddop receive new" do
      require 'fog/hadoop'

      puts @e.connect({:host => "lpcmf423.igrupobbva", :port =>@port}).get_metrics
    end
  end
end
