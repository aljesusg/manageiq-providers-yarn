describe ManageIQ::Providers::Yarn::InfraManager do
  it ".ems_type" do
    expect(described_class.ems_type).to eq('yarns')
  end

  it ".description" do
    expect(described_class.description).to eq('Hadoop Yarn')
  end
end