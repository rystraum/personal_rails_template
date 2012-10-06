Template::Application.routes.draw do
  mount RailsAdmin::Engine => '/manage', :as => 'rails_admin'

  devise_for :admins
  devise_for :users
  devise_for :auditors

  resources :records, only: [:new, :create]
  resources :products, only: [:index, :show]

  get "item_lookup" => "home#item_lookup", as: "item_lookup"
  post "save_notes/:product_id" => "home#save_notes"

  root to: "home#index"
end
