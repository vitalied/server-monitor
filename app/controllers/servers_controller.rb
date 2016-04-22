class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]

  # GET /servers
  def index
    @servers = Server.all
  end

  def most_cpu_usage
    @servers = Server.high_cpu_usage.all

    render :index
  end

  def most_memory_usage
    @servers = Server.high_memory_usage.all

    render :index
  end

  def most_disk_usage
    @servers = Server.high_disk_usage.all

    render :index
  end

  # GET /servers/1
  def show
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  def create
    @server = Server.new(server_params)

    if @server.save
      redirect_to servers_url, notice: 'Server was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /servers/1
  def update
    if @server.update(server_params)
      redirect_to servers_url, notice: 'Server was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /servers/1
  def destroy
    @server.destroy

    redirect_to servers_url, notice: 'Server was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:name, :shutdown_on_high_load)
    end
end
