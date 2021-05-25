class OrdersController < ApplicationController
  before_action :set_service, only: %i[new create]
  before_action :set_order, only: %i[show]

  def index
    @orders = current_user.orders
  end

  def show; end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.payment = current_user.payments.first
    @order.service = @service
    @order.status = 'pending'
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :service_id,
      :id,
      :home_delivery,
      :address,
      :apartment,
      :delivery_date,
      :start_time,
      :end_time,
      :comments
    )
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end
end
