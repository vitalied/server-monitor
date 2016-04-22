require 'rails_helper'

RSpec.describe "servers/new", type: :view do
  before(:each) do
    assign(:server, Server.new(
      name: "Name",
      shutdown_on_high_load: false,
      cpu_usage: 91.23,
      memory_usage: 92.34,
      disk_usage: 93.45
    ))
  end

  it "renders new server form" do
    render

    assert_select "form[action=?][method=?]", servers_path, "post" do

      assert_select "input#server_name[name=?]", "server[name]"
      assert_select "input#server_shutdown_on_high_load[name=?]", "server[shutdown_on_high_load]"
    end
  end
end
