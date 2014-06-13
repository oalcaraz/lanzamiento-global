class StaticController < ApplicationController
  
  def home
  	if @username.present? 

      account = Account.find_by(username: params[:username])

  		raise Exceptions::NotFound if account.present? and account.stripe_charge.blank?
  	end

    render layout: 'home'
  end

  def terms_conditions
    render layout: 'home'
  end
end
