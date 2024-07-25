class CreateReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :reactions do |t|
      t.references :reactable, polymorphic: true
      t.references :user, null: false, foreign_key: true
      t.integer :reaction_type, null: false

      t.timestamps
    end
  end
end
