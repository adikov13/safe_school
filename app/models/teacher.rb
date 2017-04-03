class Teacher < User
	
	has_many :groups
	has_many :messages
	has_many :conversations

end
