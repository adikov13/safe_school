class Conversation < ApplicationRecord
	belongs_to :teacher
	belongs_to :parent
	has_many :messages, dependent: :destroy
end
