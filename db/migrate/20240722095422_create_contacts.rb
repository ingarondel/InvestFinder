class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.string :website

      t.references :investor, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
