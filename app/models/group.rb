class Group < ApplicationRecord
	has_many :students, through: :group_students
	has_many :group_students
	has_many :subjects, through: :group_subjects
	has_many :group_subjects
	belongs_to :teacher
	validates :teacher, presence: true
end
