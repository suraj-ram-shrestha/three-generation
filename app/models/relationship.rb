class Relationship < ApplicationRecord
	belongs_to :relationship_type
	belongs_to :user
	belongs_to :related_user, :class_name => 'User'
end
