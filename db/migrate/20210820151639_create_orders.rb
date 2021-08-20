class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime "date"
      t.integer "user_id"
      t.datetime "delivered_at"
      t.string "status", default: "being_created"
      t.datetime "ordered_at"
      t.integer "ratings", default: 0
      t.timestamps
    end
  end
end
