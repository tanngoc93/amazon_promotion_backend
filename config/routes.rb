Rails.application.routes.draw do
  root "page#index"

  authenticate :admin_user do
    mount Sidekiq::Web => "/sidekiq"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      get "coupons", to: "coupons#index"
      delete "coupons", to: "coupons#destroy"
      get "categories", to: "product_categories#index"
    end
  end
end
