class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  before_filter :set_username, unless: :account_signed_in?

  rescue_from Exceptions::NotFound, with: :not_found


  def after_sign_in_path_for(resource)
    admin_user_signed_in? ? admin_dashboard_path : dashboard_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :current_password, :firstname, :lastname, :phone, :address, :refer_id, :plan_id)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :current_password, :firstname, :lastname, :phone, :address, :refer_id, :plan_id)
    end
  end
  
  def set_username
    @username = params[:username] || Account.all.first.username
  end

  def check_payment
    redirect_to account_credit_card_path if account_signed_in? and current_account.stripe_charge.blank?
  end

  private
    def not_found
      render template: 'errors/not_found', status: 404
    end

end