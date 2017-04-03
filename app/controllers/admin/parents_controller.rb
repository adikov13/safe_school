module Admin 
	class Admin::ParentsController < ApplicationController
		def index
			@parents = Parent.all
		end
		def new
			@parent = Parent.new
		end
		def create
			@parent = Parent.create(parent_params)
			if @parent.save
				redirect_to admin_parent_path @parent
			 flash[:success] = "parent has been successfully created"
			else
				render :new
				flash[:error] = "Something went wrong"
			end
		end
		def show
			@parent = Parent.find params[:id]
		end

		private

		def parent_params
			username = generate_username(params[:parent][:first_name], params[:parent][:last_name])
			password = generate_password(params[:parent][:first_name], params[:parent][:last_name])

			params.require(:parent).permit(:first_name, :last_name, :date_of_birth,
																		 :phone_number, :childrens).merge(username: username,
																		 password: password, password_confirmation: password)
		end
	end
end