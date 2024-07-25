class AddContactIdToResponse < ActiveRecord::Migration[7.1]
  def change
    add_reference :responses, :contact, null: false, foreign_key: true
  end
end
