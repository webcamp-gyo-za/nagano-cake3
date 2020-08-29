class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :item

	#validate: order_detail_id, presence: true

	enum status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}

	def subtotal
		(self.price*1.08*self.number).round
	end

	#def price
		#(self.price*1.1)
	#end




end
