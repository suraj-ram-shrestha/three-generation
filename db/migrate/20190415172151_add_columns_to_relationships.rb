class AddColumnsToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :relationship_type_id, :integer
    add_column :relationships, :user_id, :integer
    add_column :relationships, :related_user_id, :integer
  end
end
