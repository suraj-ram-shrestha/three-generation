class RelationshipType < ApplicationRecord
	has_many :relationships
	has_many :users, through: :relationships

	scope :grandfather, -> { where(name: 'grandfather') }
	scope :father, -> { where(name: 'father') }
end
