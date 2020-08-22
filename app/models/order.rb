class Order < ApplicationRecord
	validates :post_number, presence: true
	validates :adress, presence: true
	validates :name, presence: true
	belongs_to :user
	has_many :order_details, dependent: :destroy

	def subtotal
		(cart_item.price*cart_item.amount*1.1).round
	end
end
