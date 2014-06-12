class RegistrationsController < Devise::RegistrationsController

  def new
    refer = Account.find_by(username: params[:username])
    refer = Account.all.first unless refer.present? # In case of a kind of hack

    plan = Plan.where(name: params[:plan]).first
    plan = Plan.all.first unless plan.present? # In case of a kind of hack

    build_resource({plan_id: plan.id, refer_id: refer.id})
    respond_with self.resource, layout: 'home'
  end

  def create
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      #respond_with resource, 
      render 'devise/registrations/new', layout: 'home'
    end
  end

end