require "rails_helper"

RSpec.describe Api::ServersController, type: :routing do
  describe "routing" do

    it "routes to #update via PUT" do
      expect(:put => "/api/servers").to route_to("api/servers#update", format: :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/servers").to route_to("api/servers#update", format: :json)
    end

  end
end
