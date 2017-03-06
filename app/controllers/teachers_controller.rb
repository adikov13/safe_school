class TeachersController < ApplicationController
	def index
		@teachers = Teacher.all
	end
	def show
		@teacher = Teacher.find(parans[:id])
	end	
	def new
		@teacher = Teacher.new
	end
	def edit
		@teahcer = Teacher.find(params[:id])
	end
	def create 
		@teacher = Teacher.new
		if @teacher.save 
			flash[:notice]="Teacher was created successfully"
		else 
			render 'new'
		end
	end
	def update
		@teacher = Teacher.find(params[:id])
		if @teacher.update(teacher_params) 
			flash[:notice]="Teacher updated successfully"
			redirect_to teacher_path(@teacher)
		else
			render 'edit'
		end
	end
	def destroy
		@teacher = Teacher.find(params[:id])
		@teacher.destroy
		flash[:notice] = "Teacher deleted"
		redirect_to teachers_path
	end
	private
		def teacher_params
			params.require(:teacher).permit(:user_id, :name)
		end	
end
