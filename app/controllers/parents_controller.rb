class ParentsController < ApplicationController
	def new
		@parent = Parent.new
	end
	def create
		@parent = Parent.new(parent_params)
		if @parent.save 
			redirect_to parents_path
		else
			render 'new'
		end
	end
	def show
		@parent = Parent.find params[:id]
	end
	def index
		@parents = Parent.all
	end
	def edit 
		@parent = Parent.find params[:id]
	end
	def update
		@parent = Parent.find params[:id]
		if @parent.update
			redirect_to @parent
		else
			render 'edit'
		end
	end
	def destroy
		@parent = Parent.find params[:id]
		@parent.destroy
		redirect_to parents_path
	end
	private 
		def parent_params
			params.require(:parent).permit(:name, :user_id)
		end
end
