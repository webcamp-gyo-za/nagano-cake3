class AddCustomerInfoToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string, null: false, default: ""
    add_column :customers, :last_name, :string, null: false, default: ""
    add_column :customers, :first_kana, :string, null: false, default: ""
    add_column :customers, :last_kana, :string, null: false, default: ""
    add_column :customers, :post_number, :string, null: false, default: ""
    add_column :customers, :address, :string, null: false, default: ""
    add_column :customers, :phone_number, :string, null: false, default: ""
    add_column :customers, :is_deleted, :boolean, null: false, default: ""
  end
end
