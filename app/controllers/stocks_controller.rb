class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]
  def index
  	#@stocks = Stock.all
  @search = Stock.search(params[:q])
  @stocks = @search.result
  @search.build_condition if @search.conditions.empty?
  @search.build_sort if @search.sorts.empty?
     end
  def show
  	@stock = Stock.find(params[:id])
  end
  def edit
  	@stock = Stock.find(params[:id])
  end
  def new
  	@stock = Stock.new
  end
  def create
  	@stock = Stock.new(stock_params)
  	if(@stock.save)
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end
  def update
  	@stock = Stock.find(params[:id])
  	if(@stock.update_attributes(stock_params))
  		redirect_to(:action => "index")
  	else
  		render("edit")
  	end
  end
  def destroy
  	@stock = Stock.find(params[:id])
  	@stock.delete
  	redirect_to(:action => "index")
  end
  private
  def stock_params
  	params.require(:stock).permit(:unit_id, :category_id, :serial_nr, :product_name, :buy_date, :norma_amortizimit, :amortizimi, :neto_value, :color, :quantity, :comment)
  end
end