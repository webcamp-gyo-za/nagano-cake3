class CartItem < ApplicationRecord

	def subtotal
		(self.price*self.amount*1.1).round
	end


	#def subtotal
		#(self.item.price*self.amount*1.1).round
	#end
end
