Rails.application.routes.draw do

  devise_for :users
  # Basic認証のテスト用
  # resources :hoges, only:[:index]
  root to: "items#index"

  resources :items do
    resources :orders, only:[:index, :create]
  end

end
