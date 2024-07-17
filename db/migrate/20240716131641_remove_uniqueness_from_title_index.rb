class RemoveUniquenessFromTitleIndex < ActiveRecord::Migration[7.1]
  def change
    remove_index :ideas, :title, unique: true
    add_index :ideas, :title
  end
end
