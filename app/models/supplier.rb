class Supplier < ApplicationRecord
  has_one_attached :photo
  has_many :services, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, length: { in: 8..12, allow_blank: true }
  validates :opens_at, numericality: { in: 0..23 }
  validates :close_at, numericality: { in: 0..23 }

  def delivery?
    delivery
  end

  def self.categories(category)
    joins(services: [:categories]).where({ categories: { id: category.id } }).group(:name,:id)
  end

  def self.search(search)
    if search
      where('suppliers.name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
