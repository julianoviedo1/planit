class Supplier < ApplicationRecord
  has_one_attached :photo
  has_many :services, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: { in: 8..12, allow_blank: true }

  def delivery?
    delivery
  end

  def self.categories(category)
    joins(services: [:categories]).where({ categories: { id: category.id } }).group(:name, :id)
  end
end
