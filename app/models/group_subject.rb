class GroupSubject < ApplicationRecord
	belongs_to :subject
	belongs_to :group
end
