# frozen_string_literal: true

# Service to download ftp files from the server
class Payment < ApplicationRecord
  enum payment_type: { cash: 0, credit_card: 1, debit_card: 2, wire: 3, bank_check: 4 }

  belongs_to :user
  has_many :orders

  validates :card_number, length: { is: 16, allow_blank: true }
  validates :secure_number, length: { is: 3, allow_blank: true }
  validates :payment_type, presence: true, inclusion: { in: payment_types.keys }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}".strip
  end
end
