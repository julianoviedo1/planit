ActiveAdmin.register User do
  controller do
    skip_before_action :authenticate_user!
  end
end
