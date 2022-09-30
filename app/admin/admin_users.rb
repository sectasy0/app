ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  config.remove_action_item(:destroy)

  action_item :delete, only: :show do
    link_to "Delete Admin User", admin_admin_user_path, method: :delete, 
        class: "button-danger", data: { confirm: "Are you sure you want to delete this admin?" }
end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
