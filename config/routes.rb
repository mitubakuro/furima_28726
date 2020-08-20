Rails.application.routes.draw do

  devise_for :users
  # Basic認証のテスト用
  # resources :hoges, only:[:index]
  # root to: "hoges#index"
end
