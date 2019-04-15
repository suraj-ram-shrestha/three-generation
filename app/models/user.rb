class User < ApplicationRecord

	has_many :relationships
	has_many :relationship_types, class_name: 'Relationship', foreign_key: 'related_user_id'
end
