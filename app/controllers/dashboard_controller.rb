class DashboardController < ApplicationController

	def index
		@children = Account.where(refer: current_account)
		@parent = Account.find(current_account.refer.id)
	end
	
end
