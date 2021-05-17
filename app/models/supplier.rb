class Supplier < ApplicationRecord
  has_many :services, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: { in: 8..12, allow_blank: true }
end
