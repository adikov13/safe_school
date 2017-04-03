class Student < User
	
	has_one :group, through: :group_student
	has_one :group_student
	belongs_to :parent

end
