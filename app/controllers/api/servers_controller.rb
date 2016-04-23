class Api::ServersController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate

  # PATCH/PUT /api/servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.json { render :show, status: :ok, location: @server }
      else
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def authenticate
      set_server || render_unauthorized
    end

    def set_server
      @server = Server.find_by(token: params[:token])
    rescue
      render_unauthorized
    end

    def render_unauthorized
      render json: "Bad credentials.", status: :unauthorized
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      attrs = params.fetch(:server, {})
      res = attrs.permit(:cpu_usage, :memory_usage, :disk_usage)
      res[:processes] = attrs.require(:processes) if attrs.has_key?(:processes)

      res
    end
end
