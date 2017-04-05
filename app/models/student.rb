class Student < User
	
	has_one :group, through: :group_student
	has_one :group_student
	has_one :parent_student
	has_one :parent, through: :parent_student

end
