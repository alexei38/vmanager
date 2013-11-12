class HostsController < ApplicationController
  include ActionView::Helpers::NumberHelper 
  #load_and_authorize_resource
  def index
    @hosts = Host.all
    @host = Host.new
    
    respond_to do |format|
      format.html
    end
  end

  def show
    @host = Host.find(params[:id])
 
     respond_to do |format|
      format.html
    end
  end

  def create
    @host = Host.new(params[:host])
    if @host.save
      respond_to do |format|
        format.html {}
        format.js {}
      end
    else
      #render "new"
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
      format.html { redirect_to hosts_path }
      format.xml  { head :ok }
    end
  end

  def memory
    @host = Host.find(params[:id])
    memory_used = @host.get_memory_max.to_f - @host.get_memory_free.to_f
    memory_max = @host.get_memory_max.to_f ||= 1
    memory_percentage = (memory_used / memory_max * 100).to_i
    respond_to do |format|
      format.json {
      render :json => { 
                        :percent => memory_percentage,
                        :memory_max => number_to_human_size(memory_max.to_i),
                        :memory_used => number_to_human_size(memory_used.to_i)
                      }
    }
    end
  end

end
