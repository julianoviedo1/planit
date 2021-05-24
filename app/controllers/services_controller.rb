class ServicesController < ApplicationController
  before_action :set_service, only: %i[show]

  def show; end

  private

  def set_service
    @service = Service.find(params[:id])
  end
end
