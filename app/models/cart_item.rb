class CartItem < ApplicationRecord

	belongs_to :customer
	belongs_to :item
	validates :customer_id, presence: true
	validates :item_id, presence: true


	def subtotal
		(self.price*self.amount*1.1).round
	end


	#def subtotal
		#(self.item.price*self.amount*1.1).round　こっちか正しい？？？s
	#end

end
