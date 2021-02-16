ActiveAdmin.register Item do

  permit_params :name, :description, :price_cents, :category_id, :user_id

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :user_id, :category_id, :price_cents
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :user_id, :category_id, :price_cents]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
