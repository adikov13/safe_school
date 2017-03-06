module Admin 
	class Admin::StudentsController < ApplicationController
		def index

		end
		def new
			
		end
		def create
			user = User.create(email: "qwe@qwe.com", password:"123456",
				date_of_birth: params[:date_of_birth],
				first_name: params[:first_name],
				last_name: params[:last_name],
				phone_number: params[:phone_number],
				password_confirmation: "123456", user_type_id: 1 )
			@student = Student.create(user_id: user.id, parent_id: 1)
			redirect_to admin_student_path @student
		end
		def show
			@student = Student.find params[:id]
		end
	end
end