class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :name
      t.integer :party_size
      t.string :email

      t.timestamps null: false
    end
    add_index :invitations, :name, unique: true
  end
end
