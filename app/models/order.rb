class Order < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, completed: 2, cancelled: 3 }
  belongs_to :user
  belongs_to :payment
  belongs_to :service

  validates_inclusion_of :start_time, in: 0..23, on: :update
  validates_inclusion_of :end_time, in: 0..23, on: :update
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :address, presence: true, on: :update

  def delivery?
    service.supplier.delivery?
  end

  def supplier_address
    service.supplier.address
  end
end
