ActiveAdmin.register Item do
  # form partial: 'item_form'
  form do |f|
    f.semantic_errors # shows errors on :base
    # f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :user
      f.input :category
      f.input :name
      f.input :description
      f.input :price
      f.input :photo, as: :file
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  show do
      attributes_table do
        row :name
        row :description
        row :category
        row :price
        row :user
        row :created_at
        row :updated_at
        row :photo do |ad|
          cl_image_tag ad.photo.key, crop: :fill, gravity: :center, size: "200x200"
        end
        active_admin_comments
      end
    end

    index do
      selectable_column
      column :id
      column :name
      column :description
      column :user, sortable: :user_id
      column :created_at
      column :updated_at
      column :category
      column :price, sortable: :price_cents
      column :photo
      column "photo" do |item|
        if item.photo.present?
          cl_image_tag item.photo.key, crop: :fill, gravity: :center, size: "50x50"
        # link_to post.title, admin_post_path(post)
        end
      end
      actions
    end

    permit_params :name, :description, :price, :photo, :category_id, :user_id

  end

  # form do |f|
  #     f.inputs "Identity" do
  #       f.input :name
  #       f.input :description
  #     end
  #     f.inputs "Admin" do
  #       f.input :price_cents
  #       f.input :user_id
  #       f.input :photo, as: :file
  #     end
  #     f.actions
  #   end





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


