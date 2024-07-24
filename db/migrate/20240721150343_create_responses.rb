class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.references :idea, null: false, foreign_key: true
      t.references :investor, null: false, foreign_key: { to_table: :users }
    end
  end
end
