ActiveAdmin.register ItemOption do

  permit_params :name, :price_cents, :item_id, :user_id

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :user_id, :item_id, :price_cents
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :user_id, :item_id, :price_cents]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
