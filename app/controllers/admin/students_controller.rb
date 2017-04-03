module Admin 
	class Admin::StudentsController < ApplicationController
		def index

		end

		def new
			@student = Student.new
		end

		def create
			@student = Student.create(student_params)
			if @student.save
				redirect_to admin_student_path @student
			 flash[:success] = "Student has been successfully created"
			else
				render :new
				flash[:error] = "Something went wrong"
			end
		end

		def show
			@student = Student.find params[:id]
		end

		private

		def student_params
			username = generate_username(params[:student][:first_name], params[:student][:last_name])
			password = generate_password(params[:student][:first_name], params[:student][:last_name])

			params.require(:student).permit(:first_name, :last_name, :date_of_birth, 
																		 :phone_number).merge(username: username, 
																		 password: password, password_confirmation: password)
		end
	end
end