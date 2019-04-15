class UsersController < ApplicationController

	def index
		grandfather_relation = RelationshipType.grandfather.last
		@grandfathers = grandfather_relation.users.uniq
	end

	def import
		User.my_import(params[:file])
		redirect_to root_url, notice: "Success"
	end
end
