ActiveAdmin.register Order do
  menu priority: 2
  form do |f|
    f.semantic_errors # shows errors on :base
    # f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :state
      f.input :amount
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  show do
      attributes_table do
        row :state
        row :amount
        row :checkout_session_id
        row :user
        row :created_at
        row :updated_at
        row :quantity
      end
        active_admin_comments
    end

    index do
      column :id
      column :state
      column :amount, sortable: :amount_cents
      column :checkout_session_id
      column :user
      column :created_at
      column :updated_at
      column :quantity
      actions
    end

    batch_action :destroy, false

    permit_params :state, :amount
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :state, :amount_cents, :checkout_session_id, :user_id, :quantity
  #
  # or
  #
  # permit_params do
  #   permitted = [:state, :amount_cents, :checkout_session_id, :user_id, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
