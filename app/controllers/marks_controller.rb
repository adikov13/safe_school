class MarksController < ApplicationController
	def index
    # @students = Student.all 
    # @groups = Group.all
    # @subjects = Subject.all
    # start_month = Date.parse("2016-09-01")
    # end_month = Date.parse("2017-05-01")
    # @school_year = start_month..end_month
    # @school_year = @school_year.map{ |d| Date.new(d.year, d.month, 1) }.uniq 
    # @month = Date.parse("2017-03-01")
    # @days = @month..@month.next_month.prev_day #помещаем даты в в массив с 
    # params[:month] ||= "4"
    # date = Date.parse("2017", params[:month], "01")
    # date_range = date..date.end_of_month
    # @marks = Mark.where(date: date_range)
    @month_list = {September: 9, October: 10, November: 11, March: 3, April: 4}
	end

	def load_data
		@groups = current_user.groups
		@group = @groups.find(params[:group_id])

		@subjects = @group.subjects
    @subject = @subjects.find(params[:subject_id])

    @students = @group.students
    @days = Time.days_in_month(params[:month].to_i)
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


# class MarksController < ApplicationController
# 	def index
#     @students = Student.all 
#     @groups = Group.all
#     @subjects = Subject.all
#     @month = Date.new(2017-03-01) 
#     @days = @month..@month.next_month.prev_day #помещаем даты в в массив с 
#     @month_list = {September: 9, October: 10, November: 11}
# 	end

# 	def edit
# 		@mark = Mark.find(params[:id])
# 	end

# 	def create
# 		@mark = Mark.create marks_params
# 	end

# 	def update
# 		@mark = Mark.find(params[:id])
# 	end

# 	def destroy
# 		@mark = Mark.find(params[:id])
# 	end

# 	private
# 		def marks_params
# 			params.require(:mark).permit(:grade, :student_id, :subject_id, :date)
# 		end
# end