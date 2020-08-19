class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id, null: false, default: ""
      t.string :post_number, null: false, default: ""
      t.string :address, null: false, default: ""
      t.text :name, null: false, default: ""

      t.timestamps
    end
  end
end
