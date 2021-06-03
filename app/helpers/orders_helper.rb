module OrdersHelper
  def delivery_button_disabled
    @order.has_delivery? ? '' : 'disabled'
  end

  def delivery_adress_value
    @order.has_delivery? ? current_user.address.to_s : @order.supplier_address.to_s
  end
end
