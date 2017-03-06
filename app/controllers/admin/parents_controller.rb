module Admin 
	class Admin::ParentsController < ApplicationController
		def index

		end
		def new
			
		end
		def create
			user = User.create(email: "qwer@qwer.com", password:"123456",
				date_of_birth: params[:date_of_birth],
				first_name: params[:first_name],
				last_name: params[:last_name],
				phone_number: params[:phone_number],
				password_confirmation: "123456", user_type_id: 1 )
			@parent = Parent.create(user_id: user.id, childrens: params[:childrens] )
			redirect_to admin_parent_path @parent
		end
		def show
			@parent = Parent.find params[:id]
		end
	end
end