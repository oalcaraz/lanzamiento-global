class DashboardController < ApplicationController

	def index
		padres = Account.find(1 == @accounts_id)
	end
	
end
