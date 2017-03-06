module Admin
	class Admin::TeachersController < ApplicationController
		def index
			
		end

		def new

		end

		def show
			@teacher = Teacher.find(params[:id])
		end

		def create
			user = User.create(email: "b@gmail.com", password: "qwerty",
												password_confirmation: "qwerty", first_name: params[:first_name],
												last_name: params[:last_name], date_of_birth: params[:date_of_birth],
												phone_number: params[:phone_number], user_type_id: 2
												)
			@teacher = Teacher.create(user_id: user.id, group: params[:group],
																teaching_courses: params[:teaching_courses])
			redirect_to admin_teacher_path(@teacher)
		end
	end
end