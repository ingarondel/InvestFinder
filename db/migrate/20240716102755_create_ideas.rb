class CreateIdeas < ActiveRecord::Migration[7.1]
  def change
    create_table :ideas do |t|
      t.string  :title,            null: false, limit: 100
      t.text    :description,      null: false
      t.float   :fund_capital,     null: false
      t.string  :problem_solved,   null: false, limit: 200
      t.string  :industries,        null: false
      t.string  :geographic_focus, null: false
      t.string  :team_members,     null: false
      t.text    :next_steps
      t.string  :investor_require, null: false, limit: 200

      t.timestamps
    end
    add_index :ideas, :title, unique: true
  end
end
