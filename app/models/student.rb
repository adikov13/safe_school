class Student < ApplicationRecord
	belongs_to :user
	has_one :group, through: :group_student
	has_one :group_student
	belongs_to :parent
	def get_first_name
		return self.user.first_name
	end
	def get_last_name
		return self.user.last_name
	end
	def get_info
		user = self.user
		return user.first_name, user.last_name
	end
end
