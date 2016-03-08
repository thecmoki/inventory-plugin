class AmortnormsController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])


  def new
    @amortnorm = Amortnorm.new
  end

  def index
    @amortnorms = Amortnorm.all
  end

  def create
    @amortnorm = Amortnorm.new(amortnorm_params)
    if(@amortnorm.save)
      redirect_to(:action => "index")
        flash[:notice] = "Amortization Norm successful created."
      else
        render("new")
      end
  end

  def show
  end

  def update
     @amortnorm = Amortnorm.find(params[:id])
      if (@amortnorm.update_attributes(amortnorm_params))
        redirect_to(:action => "index")
        flash[:notice] = "Successful update."
      else
        render("edit")
      end
  end

  def edit
    @amortnorm = Amortnorm.find(params[:id])
  end
  def destroy
    @amortnorm = Amortnorm.find(params[:id])
      @amortnorm.delete
      redirect_to(:action => "index")
  end

  private
    def amortnorm_params
    params.require(:amortnorm).permit(:name, :comment)
  end

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end
