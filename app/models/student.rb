class Student < ApplicationRecord
	belongs_to :user
	has_one :group, through: :group_students
end
