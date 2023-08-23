class ApplicationController < ActionController::Base


  #管理者のサインイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    when Public
      root_path
    when Admin
      items_path
    end
  end

  #管理者のサインアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :public
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

end
