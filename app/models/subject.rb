class Subject < ApplicationRecord
	belongs_to :teacher
	has_many :marks
	has_many :groups, through: :group_subjects
	has_many :group_subjects
end
