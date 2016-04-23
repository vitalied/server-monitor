require 'rails_helper'

RSpec.describe "api/servers/show", type: :view do
  before(:each) do
    @server = assign(:server, Server.create!(
      name: "Name",
      shutdown_on_high_load: false,
      cpu_usage: 91.23,
      memory_usage: 92.34,
      disk_usage: 93.45
    ))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/91.23/)
    expect(rendered).to match(/92.34/)
    expect(rendered).to match(/93.45/)
    expect(rendered).to match(/false/)
  end
end
