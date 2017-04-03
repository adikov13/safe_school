class Message < ApplicationRecord
	belongs_to :conversation
	belongs_to :teacher
end
