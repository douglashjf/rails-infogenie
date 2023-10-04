class RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  protected

  def after_sign_up_path_for(resource)
    edit_category_path(1)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[photo])
  end
end
