ActiveAdmin.register ItemOption do

  form do |f|
    f.semantic_errors # shows errors on :base
    # f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :user
      f.input :item
      f.input :name
      f.input :price
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  show do
      attributes_table do
        row :name
        row :user
        row :item
        row :created_at
        row :updated_at
        row :price
        active_admin_comments
      end
    end

    index do
      selectable_column
      column :id
      column :name
      column :user, sortable: :user_id
      column :item, sortable: :item_id
      column :created_at
      column :updated_at
      column :price, sortable: :price_cents
      actions
    end

    permit_params :name, :price, :item_id, :user_id

  end

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


