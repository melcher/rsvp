class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :party_size
      t.text :comment
      t.text :food_restrictions
      t.string :responded_with
      t.references :invitation, index: true

      t.timestamps null: false
    end
    add_foreign_key :responses, :invitations
  end
end
