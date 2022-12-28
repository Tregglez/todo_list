ActiveRecord::Schema[7.0].define(version: 2022_12_22_031417) do
  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
