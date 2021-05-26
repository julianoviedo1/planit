class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show]

  def show
    @services = @supplier.services
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end
end
