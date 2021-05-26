class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update]
  before_action :set_service, only: %i[create]

  def index
    @orders = current_user.orders
  end

  def show; end

  def edit; end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.service = @service
    @order.payment = current_user.payments.first
    @order.status = 'pending'
    if @order.save
      redirect_to edit_order_path(@order)
    else
      render service_path(@order.service)
    end
  end

  def update
    if @order.update(order_params)
      redirect_to order_path(@order)
    else
      render :edit
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
      :comments,
      :quantity
    )
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:order][:service_id])
  end
end
