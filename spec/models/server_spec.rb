require 'rails_helper'

RSpec.describe Server, type: :model do

  let(:server) {
    Server.create!(
      name: "Name",
      shutdown_on_high_load: false,
      cpu_usage: 91.23,
      memory_usage: 92.34,
      disk_usage: 93.45,
      processes: []
    )
  }

  it "should be valid" do
    expect(server).to be_valid
  end

  it "should have_token" do
    expect(server.token).to be_present
  end

  it "should have high_cpu_usage" do
    expect(server.high_cpu_usage?).to be true
  end

  it "should have high_memory_usage" do
    expect(server.high_memory_usage?).to be true
  end

  it "should have high_disk_usage" do
    expect(server.high_disk_usage?).to be true
  end

  it "should have high_resources_usage" do
    expect(server.high_resources_usage?).to be true
  end

end
