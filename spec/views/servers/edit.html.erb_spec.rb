require 'rails_helper'

RSpec.describe "servers/edit", type: :view do
  before(:each) do
    @server = assign(:server, Server.create!(
      name: "Name",
      shutdown_on_high_load: false,
      cpu_usage: 91.23,
      memory_usage: 92.34,
      disk_usage: 93.45
    ))
  end

  it "renders the edit server form" do
    render

    assert_select "form[action=?][method=?]", server_path(@server), "post" do

      assert_select "input#server_name[name=?]", "server[name]"
      assert_select "input#server_shutdown_on_high_load[name=?]", "server[shutdown_on_high_load]"
    end
  end
end
