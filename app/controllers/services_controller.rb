class ServicesController < ApplicationController

  def show
    @service
  end

  private

  def service_params
    params.require(:service).permit(:name, :desc)
  end
end
