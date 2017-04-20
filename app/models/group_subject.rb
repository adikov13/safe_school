class GroupStudent < ApplicationRecord
	belongs_to :subject
	belongs_to :group
end
