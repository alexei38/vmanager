class HostsController < ApplicationController

  #load_and_authorize_resource
  require 'virt'
  def index
    @hosts = Host.all
   end

  def show
    @host = Host.find(params[:id])
 
     respond_to do |format|
      format.html
    end
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(params[:host])
    if @host.save
      redirect_to @host
    else
      render "new"
    end
  end

  def edit
    @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
 
    if @host.update_attributes(params[:host])
      redirect_to @host
    else
      render 'edit'
    end
  end

  def destroy
    @host = Host.find(params[:id])
    @host.destroy
    respond_to do |format|
      format.html { redirect_to admin_hosts_path }
      format.xml  { head :ok }
    end
  end

end
