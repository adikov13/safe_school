class Teacher < ApplicationRecord
	belongs_to :user
	has_many :groups
	validates :teaching_courses, presence: true
end
