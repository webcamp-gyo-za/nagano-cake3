class Item < ApplicationRecord
	validates :name, presence: true
	validates :introduction, presence: true
	validates :genre, presence: true
	validates :price, presence: true, numericality: {only_integer: true}

	has_many :cart_items, dependent: :destroy
	has_many :oder_details, dependent: :destroy
	has_many :customer, through: :cart_items
	has_many :items, through: :order_details
	belongs_to :genre
	attachment :image
end
