require 'rails_helper'

RSpec.describe "Api::Servers", type: :request do

  let(:server) { Server.create!(name: "Name") }

  describe "PUT /api/servers" do
    it "request to /api/servers" do
      put api_servers_path(token: server.token)
      expect(response).to have_http_status(200)
    end

    it "wrong request to /api/servers" do
      put api_servers_path(token: "random_token")
      expect(response).to have_http_status(401)
    end
  end

end
