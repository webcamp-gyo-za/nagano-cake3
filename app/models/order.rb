class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details, dependent: :destroy

	validates :post_number, presence: true
	validates :adress, presence: true
	validates :name, presence: true

	enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
	enum status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}
	def subtotal
		(cart_item.price*cart_item.amount*1.1).round
	end
end
