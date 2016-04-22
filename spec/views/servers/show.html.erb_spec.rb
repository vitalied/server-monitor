require 'rails_helper'

RSpec.describe "servers/show", type: :view do
  before(:each) do
    @server = assign(:server, Server.create!(
      name: "Name",
      shutdown_on_high_load: false,
      cpu_usage: 91.23,
      memory_usage: 92.34,
      disk_usage: 93.45,
      processes: [
        ["cc1", 75.01]
      ]
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Token/)
    expect(rendered).to match(/No/)
    expect(rendered).to match(/91.23/)
    expect(rendered).to match(/92.34/)
    expect(rendered).to match(/93.45/)
    expect(rendered).to match(/75.01/)
  end
end
