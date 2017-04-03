class Parent < User
	has_many :students, through: :parent_students
	has_many :parent_students
end
