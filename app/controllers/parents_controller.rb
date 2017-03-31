class ParentsController < ApplicationController
	def show
		@parent = Parent.find params[:id]
		@user = @parent.user
	end
end
