module Admin 
	class Admin::StudentsController < ApplicationController
		def index

		end
		def new
			
		end
		def create
			username = generate_username(params[:first_name], params[:last_name])
			password = generate_password(params[:first_name], params[:last_name])
			
			user = User.create(username: username, password: password,
				date_of_birth: params[:date_of_birth],
				first_name: params[:first_name],
				last_name: params[:last_name],
				phone_number: params[:phone_number],
				password_confirmation: password, user_type_id: 1 )
			@student = Student.create(user_id: user.id, parent_id: 1)
			redirect_to admin_student_path @student
		end
		def show
			@student = Student.find params[:id]
		end
	end
end