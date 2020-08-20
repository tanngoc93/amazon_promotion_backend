ActiveAdmin.register Supplier do
  menu priority: 4
  permit_params :name, :domain, :description

  index do
    selectable_column
    column :name
    column :domain
    column :created_at
    column :updated_at
    actions
  end
end
