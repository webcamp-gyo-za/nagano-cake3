class CartItem < ApplicationRecord

	belongs_to :customer
	belongs_to :item
	validates :customer_id, presence: true
	validates :item_id, presence: true
	validates :amount, presence: true

	def subtotal
		(self.item.price * 1.08.to_f*self.amount.to_f).round.to_i

	end


	#def subtotal
		#(self.item.price*self.amount*1.1).round　こっちか正しい？？？s
	#end

end
