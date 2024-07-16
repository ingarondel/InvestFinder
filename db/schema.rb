# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_16_131641) do
  create_table "ideas", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.text "description", null: false
    t.float "fund_capital", null: false
    t.string "problem_solved", limit: 200, null: false
    t.string "industries", null: false
    t.string "geographic_focus", null: false
    t.string "team_members", null: false
    t.text "next_steps"
    t.string "investor_require", limit: 200, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_ideas_on_title"
  end

end
