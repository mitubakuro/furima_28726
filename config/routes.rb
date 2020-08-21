Rails.application.routes.draw do

  devise_for :users
  # Basic認証のテスト用
  # resources :hoges, only:[:index]
  # root to: "users#sign_up"

  resources :items, only:[:index, :edit, :show, :new]

end
