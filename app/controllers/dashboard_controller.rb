class DashboardController < ApplicationController

	def index
		@children = Account.where(refer: current_account)
		@parent = Account.find(current_account.refer.id)
		@parent2 = Account.find(@parent.refer.id)
		@parent3 = Account.find(@parent2.refer.id)
	end
	
end
