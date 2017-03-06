class Teacher < ApplicationRecord
	belongs_to :user
	has_many :groups
	validates :teaching_courses, presence: true

  def full_name
  	self.user.first_name + ' ' + self.user.last_name
  end

end
