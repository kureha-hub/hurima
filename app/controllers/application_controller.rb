class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Deviseのストロングパラメータを設定
  def configure_permitted_parameters
    # サインアップ時にname, imageを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    
    # アカウント編集時に name, profile, university, image を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :university, :image])
  end

  # 編集後のリダイレクト先を指定（デフォルトは root_path）
  def after_update_path_for(resource)
    tweets_path
  end
end
