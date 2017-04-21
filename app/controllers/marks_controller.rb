class MarksController < ApplicationController
	def index
    @month_list = {September: 9, October: 10, November: 11, March: 3, April: 4}
	end

	def load_data
		@groups = current_user.groups
		@group = @groups.find(params[:group_id])

		@subjects = @group.subjects
    @subject = @subjects.find(params[:subject_id])

    @students = @group.students
    # @days = Time.days_in_month(params[:month].to_i)
    date = Date.new(2017, params[:month].to_i)
    start_date = date
    end_date = date.end_of_month
    @marks = Mark.where("date >= ? and date <= ?", start_date, end_date)
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
