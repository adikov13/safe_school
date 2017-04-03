module Admin
	class Admin::GroupsController < ApplicationController
		def index
			@groups = Group.all
		end

		def new
			@group = Group.new
		end

		def show
			@group = Group.find(params[:id])
		end

		def create
			@group = Group.new(group_params)
			if @group.save
				redirect_to admin_groups_path
			else
				render :new
			end
		end

		private
			def group_params
				params.require(:group).permit(:name, :teacher_id)
			end
	end
end