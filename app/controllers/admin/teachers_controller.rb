module Admin
	class Admin::TeachersController < ApplicationController
		def index
			@teachers = Teacher.all
		end

		def new
			@teacher = Teacher.new
		end

		def show
			@teacher = Teacher.find(params[:id])
		end

		def create
			@teacher = Teacher.create(teacher_params)
			if @teacher.save
				redirect_to admin_teacher_path @teacher
			 flash[:success] = "teacher has been successfully created"
			else
				render :new
				flash[:error] = "Something went wrong"
			end
		end

		private

		def teacher_params
			username = generate_username(params[:teacher][:first_name], params[:teacher][:last_name])
			password = generate_password(params[:teacher][:first_name], params[:teacher][:last_name])

			params.require(:teacher).permit(:first_name, :last_name, :date_of_birth, 
																		 :phone_number).merge(username: username, 
																		 password: password, password_confirmation: password)
		end
	end
end