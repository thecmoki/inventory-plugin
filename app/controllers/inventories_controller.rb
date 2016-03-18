class InventoriesController < ApplicationController
  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  def index
    if(session[:lan] == nil)
      session[:lan] = "en"
    elsif(params[:lan] == "en" || params[:lan] == "al")
      session[:lan] = params[:lan]
    else
      session[:lan]
    end
    @users = User.all
    @units = Unit.all
  	#@inventories = Inventory.all
    if(User.current.admin == true)
      if params[:q]  == nil
        @search = Inventory.search(params[:q])
        @inventories = @search.result.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
        @search.build_condition if @search.conditions.empty?
        @search.build_sort if @search.sorts.empty?
      else
        @search = Inventory.search(params[:q])
        @inventories = @search.result.paginate(:page => params[:page]).order("created_at DESC")
        @search.build_condition if @search.conditions.empty?
        @search.build_sort if @search.sorts.empty?
      end
    else
      @inventories = Inventory.all
      @search = Inventory.search(params[:q])
      @search.build_condition if @search.conditions.empty?
      @search.build_sort if @search.sorts.empty?
    end
  end

  def show
  	@inventory = Inventory.find(params[:id])
  end

  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @inventory = Inventory.find(params[:id])
    end
  end

  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
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
        cat = Category.all
        unit = Unit.find(inv.product_name)
        
        user = User.find(inv.user_name)
        
        room = Room.find_by name: inv.room_name
        inv.update(:amortization_norm => unit.normamort)
        inv.update(:amortization => (unit.normamort.to_f / 100) * inv.neto_value.to_f)
        inv.update(:user_name => user.firstname + " " + user.lastname)
        inv.update(:user_login => user.login)
        inv.update(:product_name => unit.name)
        inv.update(:unit_id => unit.id)
        inv.update(:room_id => room.id)
        cat.each do |c|
          if(c.id == inv.unit.category_id)
            inv.update(:product_id => c.uniquecode)
          end
        end
        
        @history = History.new(:inventory_id => inv.id,:user_name => inv.user_name, :user_login => inv.user_login, :room_name => inv.room_name, :product_name => inv.product_name, :product_id => inv.product_id, :serial_number => inv.serial_number, :buy_date => inv.buy_date, :activation_date => inv.activation_date, :amortization_norm => inv.amortization_norm, :amortization => inv.amortization, :neto_value => inv.neto_value, :time_of_use => inv.time_of_use, :comment => inv.comment, :updated_at => inv.updated_at)
  		  @history.save
        redirect_to(:action => "index")
        createMessage(session[:lan])
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
        unit = Unit.find(@inventory.product_name)
        @inventory.update(:amortization_norm => unit.normamort)
        @inventory.update(:amortization => (unit.normamort.to_f / 100) * @inventory.neto_value.to_f)
        @inventory.update(:product_name => unit.name)
        @inventory.update(:user_name => user.firstname + " " + user.lastname)
        @inventory.update(:user_login => user.login)
        @history = History.new(:inventory_id => @inventory.id,:user_name => @inventory.user_name, :user_login => @inventory.user_login, :room_name => @inventory.room_name, :product_name => @inventory.product_name, :product_id => @inventory.product_id, :serial_number => @inventory.serial_number, :buy_date => @inventory.buy_date, :activation_date => @inventory.activation_date, :amortization_norm => @inventory.amortization_norm, :amortization => @inventory.amortization, :neto_value => @inventory.neto_value, :time_of_use => @inventory.time_of_use, :comment => @inventory.comment, :updated_at => @inventory.updated_at)
  		  @history.save
        redirect_to(:action => "index")
        updateMessage(session[:lan])
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
  	  @inventory.destroy
  	  redirect_to(:action => "index")
  	end
  end

  private
    
  def inventory_params
  	params.require(:inventory).permit(:user_name, :user_login, :room_name, :product_name, :color, :serial_number, :buy_date, :activation_date, :amortization_norm, :amortization, :neto_value, :time_of_use, :comment)
  end
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
  def errorMessage(lan = "en")
    if(lan == "en")
      flash[:error] = "You have no access."
    elsif(lan == "al")
      flash[:error] = "Ju nuk keni qasje."
    end
  end
  def updateMessage(lan = "en")
    if(lan == "en")
      flash[:notice] = "Successful update."
    elsif(lan == "al")
      flash[:notice] = "U ndryshua me sukses."
    end
  end
  def createMessage(lan = "en")
    if(lan == "en")
      flash[:notice] = "Successful created."
    elsif(lan == "al")
      flash[:notice] = "U krijua me sukses"
    end
  end
end