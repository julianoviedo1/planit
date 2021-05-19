class Service < ApplicationRecord
  belongs_to :supplier
  has_many :orders
  has_many :service_categories, dependent: :destroy
  has_many :categories, through: :service_categories
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
