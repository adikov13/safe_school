json.students @students do |student|
	json.id student.id
	json.full_name student.full_name
end

json.marks @marks do |mark|
	json.student_id mark.student_id
	json.date mark.date
	json.grade mark.grade
end
json.days @days
