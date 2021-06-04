ActiveAdmin.register Supplier do
  controller do
    skip_before_action :authenticate_user!
  end
end
