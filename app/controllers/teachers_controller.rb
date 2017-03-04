class TeachersController < ApplicationController
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
	def show
		@teacher = Teacher.find params[:id]
	end
	def index
		@teachers = Teacher.all
	end
	def edit 
		@teacher = Teacher.find params[:id]
	end
	def update
		@teacher = Teacher.find params[:id]
		if @teacher.update
			redirect_to @teacher
		else
			render 'edit'
		end
	end
	def destroy
		@teacher = Teacher.find params[:id]
		@teacher.destroy
		redirect_to teachers_path
	end
	private 
		def teacher_params
			params.require(:teacher).permit(:name, :user_id)
		end
end
