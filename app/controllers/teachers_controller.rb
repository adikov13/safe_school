class teachersController < ApplicationController
	def new
		@teacher = teacher.new
	end
	def create
		@teacher = teacher.new(teacher_params)
		if @teacher.save 
			redirect_to teachers_path
		else
			render 'new'
		end
	end
	private 
		def teacher_params
			params.require(:teacher).permit(:name, :user_id)
		end
end
