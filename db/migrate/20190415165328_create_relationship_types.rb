class CreateRelationshipTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_types do |t|

      t.timestamps
    end
  end
end
