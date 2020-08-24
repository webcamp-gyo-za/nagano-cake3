class OrderDetail < ApplicationRecord
	belongs_to :order

	enum status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}

	def subtotal
		(self.price*self.amount*1.1).round
	end



end
