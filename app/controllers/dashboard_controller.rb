class DashboardController < ApplicationController

	def index
		@children = Account.where(refer: current_account)
    
		@parent = Account.find(current_account.refer.id)
		@parent2 = Account.find(@parent.refer.id) if @parent.refer.present?
		@parent3 = Account.find(@parent2.refer.id) if @parent2.present? and @parent2.refer.present?
	end
	
end
