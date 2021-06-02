class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update]

  def index
    @payments = current_user.payments
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user = current_user
    if @payment.save
      redirect_to payments_path
    else
      render new_payment_path
    end
  end

  def edit; end

  def update
    if @payment.update(payment_params)
      redirect_to payments_path
    else
      render :edit
    end
  end

  private

  def payment_params
    params.require(:payment).permit(
      :id,
      :payment_type,
      :card_number,
      :secure_number,
      :current_method
    )
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end


  def current_user_payments_used
    current_user.payments.each(&:current_method)
  end
end
