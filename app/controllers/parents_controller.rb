class ParentsController < ApplicationController
	def new
		@parent = Parent.new
	end
	def create
		@parent = Parent.new(parent_params)
		if @parent.save 
			redirect_to parents_path
		else
			render 'new'
		end
	end
	private 
		def parent_params
			params.require(:parent).permit(:name, :user_id)
		end
end
