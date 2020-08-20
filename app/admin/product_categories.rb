ActiveAdmin.register ProductCategory do
  menu priority: 5
  permit_params :name, :description
end
