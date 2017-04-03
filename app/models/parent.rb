class Parent < ApplicationRecord
	belongs_to :user
	has_many :students
	validates :childrens, presence: true
	# def get_info
	# 	user = self.user
	# 	return user.first_name, user.last_name, user.childrens
	# end
	def get_info
		user = self.user
		return user.first_name, user.last_name
	end
end
