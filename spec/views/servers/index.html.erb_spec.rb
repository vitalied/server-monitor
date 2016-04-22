require 'rails_helper'

RSpec.describe "servers/index", type: :view do
  before(:each) do
    assign(:servers, [
      Server.create!(
        name: "Name",
        cpu_usage: 99.99,
        memory_usage: 99.99,
        disk_usage: 99.99
      ),
      Server.create!(
        name: "Other Name",
        cpu_usage: 88.88,
        memory_usage: 88.88,
        disk_usage: 88.88
      )
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", :text => "Name", :count => 1
    assert_select "tr>td", :text => "Other Name", :count => 1
    assert_select "tr>td", :text => "99.99%", :count => 3
    assert_select "tr>td", :text => "88.88%", :count => 3
    assert_select "tr>td", :text => "", :count => 0
  end
end
