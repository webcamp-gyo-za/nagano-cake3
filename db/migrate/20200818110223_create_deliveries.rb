class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id
      t.string :post_number
      t.string :address
      t.text :name

      t.timestamps
    end
  end
end
