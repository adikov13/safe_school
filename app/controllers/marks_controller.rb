class MarksController < ApplicationController
	def index
    @students = Student.all 
    @groups = Group.all
    @subjects = Subject.all
    start_month = Date.parse("2016-09-01")
    end_month = Date.parse("2017-05-01")
    @school_year = start_month..end_month
    @school_year = @school_year.map{ |d| Date.new(d.year, d.month, 1) }.uniq 
    @month = Date.parse("2017-03-01")
    @days = @month..@month.next_month.prev_day #помещаем даты в в массив с 
	end

	def edit
		@mark = Mark.find(params[:id])
	end

	def create
		@mark = Mark.create marks_params
	end

	def update
		@mark = Mark.find(params[:id])
	end

	def destroy
		@mark = Mark.find(params[:id])
	end

	private
		def marks_params
			params.require(:mark).permit(:grade, :student_id, :subject_id, :date)
		end
end
