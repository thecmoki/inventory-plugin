class InventoriesController < ApplicationController
  
  def index
  	@inventories = Inventory.all
  end

  def show
  	@inventory = Inventory.find(params[:id])
  end

  def edit
  	@inventory = Inventory.find(params[:id])
  end

  def new
  	@inventory = Inventory.new
  end

  def create
  	@inventory = Inventory.new(inventory_params)
  	if(@inventory.save)
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end

  def update
  	@inventory = Inventory.find(params[:id])
  	  if (@inventory.update_attributes(params.require(:inventory).permit(:room_id, :time_of_use, :user_id, :stock_id)))
  		redirect_to(:action => "index")
  	else
  		render("edit")
  	end
  end

  def destroy
  	@inventory = Inventory.find(params[:id])
  	@inventory.delete
  		redirect_to(:action => "index")
  	end

  	private
  	def inventory_params
  		params.require(:inventory).permit(:room_id, :time_of_use, :user_id, :stock_id)
  	end
  end
  
















