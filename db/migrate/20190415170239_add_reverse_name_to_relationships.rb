class AddReverseNameToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :reverse_name, :string
  end
end
