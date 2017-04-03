class Subject < ApplicationRecord
	belongs_to :teacher
	has_many :marks
	
end
