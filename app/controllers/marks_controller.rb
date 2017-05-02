class MarksController < ApplicationController

	def index
    @month_list = {September: 9, October: 10, November: 11, March: 3, April: 4, May: 5}
		@groups = current_user.groups
		@group = params[:group_id].nil? ? @groups.first : @groups.find(params[:group_id])
		session[:group_id] = @group.id
		@subjects = @group.subjects
	end

	def load_data
		@group = current_user.groups.find(session[:group_id])
    @subject = @group.subjects.find(params[:subject_id])

    @students = @group.students
    @last_day = Time.days_in_month(params[:month].to_i)
		@days = (1..@last_day).to_a
    date = Date.new(2017, params[:month].to_i)
    start_date = date
    end_date = date.end_of_month
    @marks = @subject.marks.where("date >= ? and date <= ?", start_date, end_date)
  end

	def edit
		@mark = Mark.find(params[:id])
	end

	def create
		@mark = Mark.create(grade: params[:grade], student_id: params[:student_id],
												subject_id: params[:subject_id], date: params[:date])
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
