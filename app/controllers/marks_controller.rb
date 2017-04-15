class MarksController < ApplicationController
	def index
		@marks = Marks.all
	end

	def edit
		@mark = Mark.find(params[:id])
	end

	def create
		
	end

	def update
		@mark = Mark.find(params[:id])
	end

	def destroy
		@mark = Mark.find(params[:id])
	end

	private
		def marks_params

		end
end
