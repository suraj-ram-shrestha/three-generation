class AddNameToRelationshipTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :relationship_types, :name, :string
  end
end
