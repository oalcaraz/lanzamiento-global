class RegistrationsController < Devise::RegistrationsController

  def new
    refer = Account.find_by(username: params[:username])
    refer = Account.all.first unless refer.present? # In case of a kind of hack

    plan = Plan.where(name: params[:plan]).first
    plan = Plan.all.first unless plan.present? # In case of a kind of hack

    build_resource({plan_id: plan.id, refer_id: refer.id})
    respond_with self.resource, layout: 'home'
  end

end