class Group < ApplicationRecord
	has_many :students, through: :group_students
	has_many :group_students
	belongs_to :teacher
	validates :teacher, presence: true
end
