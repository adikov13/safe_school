class ParentsController < ApplicationController
	def index
		@parents = Parent.all
	end
	def show
		@parent = Parent.find(params[:id]
	end
	def new
		@parent = Parent.new
	end
	def edit
		@parent = Parent.find(params[:id])
	end
	def create
		@parent = Parent.new
		if @parent.save 
		   redirect_to @parent
		else
			render 'new'
		end
	end
<<<<<<< HEAD
	def update
		@parent = Parent.find(params[:id])
		if @parent.update(parent_params)
		   redirect_to @parent
		else
		   render 'edit'
		end
	end
	def destroy
		@parent = Parent.find(params[:id])
		if @parent.update(parent_params)
		   redirect_to teachers_path
	end
	private
=======
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
>>>>>>> fe78ce34e535c15c715365f1f6a1ec8b4161d8e6
		def parent_params
			params.require(:parent).permit(:name, :user_id)
		end
end
