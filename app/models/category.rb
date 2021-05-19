class Category < ApplicationRecord
  has_many :service_categories, dependent: :destroy
  has_many :services, through: :service_categories
  has_one_attached :icon

  validates :name, presence: true
end
