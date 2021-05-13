class Category < ApplicationRecord
  has_many :service_categories, dependent: :destroy
  has_many :services, through: :service_categories

  validates :name, presence: true
end
