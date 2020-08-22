class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  # before_action :basic_auth
  # private
  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'admin' && password == '2222'
  #   end
  # end

  def configure_permitted_parameters
    # deviseのUserモデルにパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,
                                                       :family_name, :first_name, :family_kana, :first_kana, :birthday])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
