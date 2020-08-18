Rails.application.routes.draw do

# Basic認証のテスト用
resources :hoges, only:[:index]
end
