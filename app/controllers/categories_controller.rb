class CategoriesController < ApplicationController
  


  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if(@category.save)
  		redirect_to(:action => "index")
  	else
  		render("edit")
  	end
  end

  def update
  	@category = Category.find(params[:id])
    if (@category.update_attributes(params.require(:category).permit(:name, :comment)))
     redirect_to(:action => "index") 
   else 
    render("edit") 
  	end 
  end

  def destroy
  	@category = Category.find(params[:id])
  	@category.delete
  	redirect_to(:action => "index")
 end

 private
 def category_params
 	params.require(:category).permit(:name, :comment)
 end
end
