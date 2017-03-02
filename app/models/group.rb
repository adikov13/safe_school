class Group < ApplicationRecord
	has_many :students, through: :group_students
end
