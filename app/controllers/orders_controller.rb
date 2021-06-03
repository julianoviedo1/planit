class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update]

  def index
    @orders = current_user.orders
  end

  def show; end

  def edit; end

  def create
    @order = Order.new(order_params)
    build_order(@order)
    if @order.save
      redirect_to edit_order_path(@order)
    else
      render service_path(@order.service)
    end
  end

  def update
    if @order.update!(order_params)
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  private

  def build_order(order)
    order.user = current_user
    order.service_id = params[:service_id]
    order.payment = current_user.payments.first
    order.status = 'pending'
  end

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
      :comments,
      :quantity
    )
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
