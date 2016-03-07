class InventoriesController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    @users = User.all
    @units = Unit.all
  	#@inventories = Inventory.all
    @search = Inventory.search(params[:q])
    @inventories = @search.result.paginate(:page => params[:page], :per_page => 15)
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    if(session[:lan] == nil)
      session[:lan] = "en"
    elsif(params[:lan] == "en" || params[:lan] == "al")
      session[:lan] = params[:lan]
    else
      session[:lan]
    end
  end

  def show
  	@inventory = Inventory.find(params[:id])
  end

  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = "You have no access."
    else
  	  @inventory = Inventory.find(params[:id])
    end
  end

  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      flash[:error] = "You have no access."
    else
  	  @inventory = Inventory.new
    end
  end

  def create
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @inventory = Inventory.new(inventory_params)
  	  if(@inventory.save)
        inv = Inventory.last
        user = User.find(inv.user_name)
        inv.update(:user_name => user.firstname + " " + user.lastname)
        inv.update(:user_login => user.login)
  		  redirect_to(:action => "index")
        flash[:notice] = "Inventory successful created."
  	  else
  		  render("new")
  	  end
    end
  end

  def update
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @inventory = Inventory.find(params[:id])
  	  if (@inventory.update_attributes(inventory_params))
        user = User.find(@inventory.user_name)
        @inventory.update(:user_name => user.firstname + " " + user.lastname)
        @inventory.update(:user_login => user.login)
  		  redirect_to(:action => "index")
        flash[:notice] = "Successful update."
  	  else
  		  render("edit")
  	 end
    end
  end

  def destroy
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @inventory = Inventory.find(params[:id])
  	  @inventory.delete
  	  redirect_to(:action => "index")
  	end
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