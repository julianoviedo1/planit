class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :payments, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :first_name, presence: true
  validates :phone_number, length: { in: 8..12, allow_blank: true }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}".strip
  end
end
