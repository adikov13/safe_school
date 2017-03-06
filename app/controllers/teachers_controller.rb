class TeachersController < ApplicationController
<<<<<<< HEAD
	def index
		@teachers = Teacher.all
	end
	def show
		@teacher = Teacher.find(parans[:id])
	end	
=======
>>>>>>> fe78ce34e535c15c715365f1f6a1ec8b4161d8e6
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
<<<<<<< HEAD
	def update
		@teacher = Teacher.find(params[:id])
		if @teacher.update(teacher_params) 
			flash[:notice]="Teacher updated successfully"
			redirect_to teacher_path(@teacher)
		else
			render 'edit'
=======
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
>>>>>>> fe78ce34e535c15c715365f1f6a1ec8b4161d8e6
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
