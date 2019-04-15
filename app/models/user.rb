class User < ApplicationRecord

	require 'csv'
	require 'activerecord-import/base'

	has_many :relationships
	has_many :relationship_types, class_name: 'Relationship', foreign_key: 'related_user_id'

	def self.my_import(file)
		users = []
		CSV.foreach(file.path, headers: true) do |row|
			binding.pry
			users << User.new(row.to_h)
		end
	User.import users, recursive: true
	end

	def self.create_three_generations(row) 

	end
end
