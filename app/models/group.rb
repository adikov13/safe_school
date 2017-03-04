class Group < ApplicationRecord
	has_many :students, through: :group_students
	has_many :group_students
	belongs_to :teacher
	validates :name, presence: true, length:{minimum: 5, maximum:10}
	validates :teacher, presence: true
end
