Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      get "coupons", to: "coupons#index"
      delete "coupons", to: "coupons#destroy"
      get "categories", to: "product_categories#index"
    end
  end

  root "page#index"
end
