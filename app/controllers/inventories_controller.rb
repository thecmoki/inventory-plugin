class InventoriesController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    @units = Unit.all
  	@inventories = Inventory.all
    @search = Inventory.search(params[:q])
    @inventories = @search.result
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
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
      inv = Inventory.last
      user = User.find(inv.user_name)
      inv.update(:user_name => user.firstname+" "+user.lastname)
      inv.update(:user_login => user.login)
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end

  def update
  	@inventory = Inventory.find(params[:id])
  	if (@inventory.update_attributes(inventory_params))
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
  		params.require(:inventory).permit(:user_name, :user_login, :room_name, :product_name, :serial_number, :buy_date, :activation_date, :amortization_norm, :amortization, :neto_value, :time_of_use, :comment)
  	end

    def find_project
      # @project variable must be set before calling the authorize filter
      @project = Project.find(params[:project_id])
    end

end

  