ActiveAdmin.register AdminUser do
  menu false
  actions :index, :show, :update, :edit
  permit_params :password, :password_confirmation

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

  show do
    attributes_table do
      row :email
      row :debug_url do |admin|
        link_to("DEBUG","https://thedogpaws.com/coupons?debug=true&token=#{admin.access_token}", target: :blank)
      end
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end
end
