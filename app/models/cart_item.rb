class CartItem < ApplicationRecord

	belongs_to :customer
	belongs_to :item
	validates :customer_id, presence: true
	validates :item_id, presence: true


	def subtotal
		#binding.pry
		(self.item.price.to_f*self.amount.to_f*1.1).round.to_i
	end


	#def subtotal
		#(self.item.price*self.amount*1.1).round　こっちか正しい？？？s
	#end

end
