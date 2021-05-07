class Order < ApplicationRecord
  enum status: { pending: 0, confirmed: 1, completed: 2, cancelled: 3 }
  belongs_to :user
  belongs_to :payment
  belongs_to :service

  validates :start_time, numericality: { in: 0..23 }
  validates :end_time, numericality: { in: 0..23 }
  validates :status, presence: true, inclusion: { in: statuses.keys }
end
