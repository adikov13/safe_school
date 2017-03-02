class Student < ApplicationRecord
	belongs_to :user
	has_one :group, through: :group_student
	has_one :group_student
	belongs_to :parent
end
