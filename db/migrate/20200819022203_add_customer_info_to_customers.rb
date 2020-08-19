class AddCustomerInfoToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :first_kana, :string
    add_column :customers, :last_kana, :string
    add_column :customers, :post_number, :string
    add_column :customers, :address, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :is_deleted, :boolean
  end
end
