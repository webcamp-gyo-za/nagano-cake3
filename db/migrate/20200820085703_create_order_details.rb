class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
    	t.integer :item_id, null: false, default: ""
    	t.integer :order_id, null: false, default: ""
    	t.integer :status, null: false, default: 0
    	t.integer :price, null: false, default: ""
    	t.integer :number, null: false, default: ""

      t.timestamps
    end
  end
end
