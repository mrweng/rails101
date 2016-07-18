class WelcomeController < ApplicationController
	def index
		flash[:notice] = "Hello morining"
		flash[:alert] = "alert msg"
		flash[:warning] = "Warning msg"
	end
end
