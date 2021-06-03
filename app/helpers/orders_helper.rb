module OrdersHelper
  def delivery_button_disabled
    @order.has_delivery? ? '' : 'disabled'
  end

  def delivery_adress_value
    @order.has_delivery? ? current_user.address.to_s : @order.supplier_address.to_s
  end

  def payment_type_icon(payment)
    case payment.payment_type
    when 'cash'
      'far fa-money-bill-alt'
    when 'credit_card', 'debit_card'
      'fab fa-cc-visa'
    when 'wire'
      'fab fa-cc-stripe'
    when 'bank_check'
      'fas fa-money-check'
    else
      'fas fa-exclamation-triangle'
    end
  end
end
