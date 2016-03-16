require 'securerandom'
class UnitsController < ApplicationController  
  before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])

  
  
  def index
    if(session[:lan] == nil)
        session[:lan] = "en"
    elsif(params[:lan] == "en" || params[:lan] == "al")
      session[:lan] = params[:lan]
    else
      session[:lan]
    end
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @units = Unit.all
      @categories = Category.all
    end
  end
  
  def show
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @unit = Unit.find(params[:id])
    end
  end
  
  def edit
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @unit = Unit.find(params[:id])
    end
  end
  
  def update
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @unit = Unit.find(params[:id])
  	  if (@unit.update_attributes(unit_params))
  		  redirect_to(:action => "index")
        updateMessage(session[:lan])
  	  else
  		  render(:controller => "units", :action => "edit")
  	  end
    end
  end
  
  def new
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
      errorMessage(session[:lan])
    else
  	  @unit = Unit.new
    end
  end

  

  
  def create
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @unit = Unit.new(unit_params)
  	  if(@unit.save)
        cat = Category.all
        cat.each do |c|
          if(c.id == @unit.category_id)
            @unit.update(:productid => c.uniquecode)
          end
        end
  		  redirect_to(:action => "index")
        createMessage(session[:lan])
  	  else
  		  render("new")
  	  end
    end
  end
  
  def destroy
    if(User.current.admin == false)
      redirect_to(:controller => "inventories", :action => "index")
    else
  	  @unit = Unit.find(params[:id])
  	  @unit.delete
  	  redirect_to(:action => "index")
    end
  end

  private
  
  def unit_params
    params.require(:unit).permit(:name, :normamort, :comment, :category_id, :quantity, :color)
  end


    

    

    # raw_string = SecureRandom.random_number( 2**80 ).to_s( 20 ).reverse
    # long_code = raw_string.tr( '0123456789abcdefghij', '234679QWERTYUPADFGHX' )
    # if @unit.category_id == 1
    #   +'-'+long_code[4..7]+'-'+long_code[8..11]
    # else 
    #   "AA2"+'-'+long_code[4..7]+'-'+long_code[8..11]
    # end
  
  

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