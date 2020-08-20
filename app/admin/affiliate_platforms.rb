ActiveAdmin.register AffiliatePlatform do
  menu priority: 3
  permit_params :name, :domain, :description
end
