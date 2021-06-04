class Payment < ApplicationRecord
  enum payment_type: { cash: 0, credit_card: 1, debit_card: 2, wire: 3, bank_check: 4 }

  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :card_number, length: { is: 16, allow_blank: true }
  validates :secure_number, length: { is: 3, allow_blank: true }
  validates :payment_type, presence: true, inclusion: { in: payment_types.keys }

  def radiobtn_array
    [payment_type, id]
  end

  def self.uncheck_active_method
    active.first.current_method = false
  end

  def current_method?
    current_method
  end

  def type_info
    if %w[credit_card debit_card].include? payment_type
      card_number.to_s.last(4)
    else
      payment_type
    end
  end
end
