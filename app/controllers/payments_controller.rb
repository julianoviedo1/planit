class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments
  end

  def new
    @payment = Payment.new
  end

  def create
  end

  def edit
  end

  def update
  end
end
