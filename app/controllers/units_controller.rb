require 'securerandom'
require 'rqrcode_png'
class UnitsController < ApplicationController 
#require File.dirname(__FILE__) + '/../../../../app/helpers/attachments_helper'
#before_filter :find_attachments, :only => [:preview,:show,:download,:upload]

menu_item :overviews, :only => [:index, :show, :edit, :new, :update, :create]
before_filter(:find_project, :authorize, :only => [:index, :show, :edit, :new, :update, :create])


  helper :attachments
  include AttachmentsHelper      
  

  def index
    update_time_of_use
	  @units = Unit.all
    @categories = Category.all
  end
  
  def show
    if params[:version] && !User.current.allowed_to?(@project)
      deny_access
      return
    end
    
    update_time_of_use
 	  @unit = Unit.find(params[:id])
    @attachments = @unit.attachments.all
    @qr = RQRCode::QRCode.new(@unit.id.to_s+" "+@unit.name+" "+@unit.comment).to_img.resize(200, 200).to_data_url
  end
  
  def edit
    update_time_of_use
    @unit = Unit.find(params[:id])
  end
  
  def update
	  @unit = Unit.find(params[:id])
	  if (@unit.update_attributes(unit_params))
		  redirect_to(:action => "index")
      flash[:notice] = l(:updateMessage)
	  else
		  render(:controller => "units", :action => "edit")
	  end
  end
  
  def new
    update_time_of_use
    @unit = Unit.new
  end
  
  def create
    @unit = Unit.new(unit_params)
	  if(@unit.save)
      attachments = Attachment.attach_files(@unit, params[:attachments])
		redirect_to(:action => "index")
    flash[:notice] = l(:createMessage)
	  else
		  render("new")
	  end
  end

  
  
  def destroy
	  @unit = Unit.find(params[:id])
	  @unit.destroy
	  redirect_to(:action => "index")
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :normamort, :comment, :category_id, :quantity)
  end

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end


  def update_time_of_use
    @inventories = Inventory.all
    @inventories.each do |inventory|
      inventory.update(:time_of_use => inventory.days)
    end
  end
end