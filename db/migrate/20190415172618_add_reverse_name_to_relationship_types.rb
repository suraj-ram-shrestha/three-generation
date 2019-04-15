class AddReverseNameToRelationshipTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :relationship_types, :reverse_name, :string
  end
end
