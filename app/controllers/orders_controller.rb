class OrdersController < ApplicationController
  def index
  end


  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:id, :name, :description, :query)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
