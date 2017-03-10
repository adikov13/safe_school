module Admin
	class Admin::TeachersController < ApplicationController
		def index
			@teachers = Teacher.all
		end

		def new

		end

		def show
			@teacher = Teacher.find(params[:id])
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
			@teacher = Teacher.create(user_id: user.id, group: params[:group],
																teaching_courses: params[:teaching_courses])
			redirect_to admin_teacher_path(@teacher)
		end
	end
end