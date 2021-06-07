class Supplier < ApplicationRecord
  has_one_attached :photo
  has_many :services, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: { in: 8..12, allow_blank: true }
  validates_inclusion_of :opens_at, in: 0..23
  validates_inclusion_of :close_at, in: 0..23

  scope :categories, ->(category) { joins(services: [:categories]).where({ categories: { id: category.id } }) }
  scope :search_name, ->(search) { where('suppliers.name LIKE ?', "%#{search}%").group(:name, :id) }

  def delivery?
    delivery
  end
end
