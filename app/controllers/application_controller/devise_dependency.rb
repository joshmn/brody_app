class ApplicationController
  def after_sign_in_path_for(resource)
    params[:redirect_to] || super
  end

  def after_sign_up_path_for(resource)
    params[:redirect_to] || super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :company_name) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
  end
end