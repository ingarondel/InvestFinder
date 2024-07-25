class AddTypeToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :type, :string, default: 'Entrepreneur', null: false
    add_index :users, :type
  end
end
