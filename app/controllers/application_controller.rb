class ApplicationController < ActionController::Base


  #管理者のサインイン後の遷移先
  def after_admin_sign_in_path_for(resource)
    admin_items_path
  end

  #管理者のサインアウト後の遷移先
  def after_admin_sign_out_path_for(resource)
    admin_sign_in_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

end
