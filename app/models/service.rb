class Service < ApplicationRecord
  belongs_to :supplier
  has_many :orders
  has_many :service_categories, dependent: :destroy
  has_many :categories, through: :service_category

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
