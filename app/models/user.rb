class User < ApplicationRecord

	require 'csv'
	require 'activerecord-import/base'

	has_many :relationships
	has_many :relationship_types, class_name: 'Relationship', foreign_key: 'related_user_id'

	GRAND_FATHER = RelationshipType.find_or_create_by(name: 'grandfather', reverse_name: 'grandson')
	FATHER = RelationshipType.find_or_create_by(name: 'father', reverse_name: 'son')

	def self.my_import(file)
		users = []
		CSV.foreach(file.path, headers: true) do |row|
			User.create_three_generations(row.to_h)
		end
	end

	# TODO: MOVE TO BACKGROUND JOB

	def self.create_three_generations(row_hash) 
		grand_father = User.find_or_create_by(name: row_hash["Grand Father"])
		father = User.find_or_create_by(name: row_hash["Father"])
		son = User.find_or_create_by(name: row_hash["Son"])

		grand_father.relate(father, FATHER)
		father.relate(son, FATHER)
		grand_father.relate(son, GRAND_FATHER)

		# Assumption: Grand Father lives with youngest grandson
		grand_father.address = father.address = son.address = row_hash["Address"]

		# TODO: REFACTOR
		grand_father.save
		father.save
		son.save
	end

	def relate(related_user, relationship_type)
	  self.relationships.find_or_create_by!(relationship_type_id: relationship_type.id, related_user_id: related_user.id)
	end
end
