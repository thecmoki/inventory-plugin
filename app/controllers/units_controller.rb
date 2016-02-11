class UnitsController < ApplicationController
  unloadable

  def index
  	@units = Unit.all
  end
  def show
  	@unit = Unit.find(params[:id])
  end
  def edit
  	@unit = Unit.find(params[:id])
  end
  def update
  	@unit = Unit.find(params[:id])
  	if (@unit.update_attributes(params.require(:unit).permit(:name, :comment)))
  		redirect_to(:action => "index")
  	else
  		render("edit")
  	end
  end
  def new
  	@unit = Unit.new
  end 
  def create
  	@unit = Unit.new(unit_params)
  	if(@unit.save)
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end
  def destroy
  	@unit = Unit.find(params[:id])
  	@unit.delete
  	redirect_to(:action => "index")
  end

  private
  def unit_params
    params.require(:unit).permit(:name, :comment)
  end
end
