class RegistrationsController < Devise::RegistrationsController

   def new
      :refer_id = Account.find(:params[:username] == @account.username, :select => 'id')

      plan = Plan.where(name: params[:plan]).first
      plan = Plan.first unless @plan_id.present? # In case of a kind of hack

      build_resource({plan_id: plan.id})
      respond_with self.resource
    end

end
