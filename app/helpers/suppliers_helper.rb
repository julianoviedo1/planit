module SuppliersHelper
  def icon(supplier)
    if supplier.delivery?
      'fas fa-truck text-info fs-6'
    else
      'fas fa-store text-info fs-6'
    end
  end
end
