class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false, default: ""
      t.string :post_number, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :name, null: false, default: ""
      t.integer :shipping_cost, null: false, default: 800
      t.integer :order_price, null: false, default: ""
      t.integer :status, null: false, default: 0
      t.integer :payment_method, null: false, default: 0

      t.timestamps
    end
  end
end
