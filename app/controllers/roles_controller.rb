class RolesController < ApplicationController
  
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
 
    respond_to do |format|
      format.html
    end
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
      redirect_to @role
    else
      render "new"
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
 
    if @role.update_attributes(params[:host])
      redirect_to @role
    else
      render 'edit'
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_path }
      format.xml  { head :ok }
    end
  end
end
