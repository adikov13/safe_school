class Parent < User
	has_many :students
<<<<<<< HEAD
	validates :childrens, presence: true
	# def get_info
	# 	user = self.user
	# 	return user.first_name, user.last_name, user.childrens
	# end
	def get_info
		user = self.user
		return user.first_name, user.last_name
	end
=======
>>>>>>> 127cc558d94f5e4acb245507c80ed0c746fa2012
end
