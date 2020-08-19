class Item < ApplicationRecord
	validates :name, presence: true
	validates :introduction, presence: true
	validates :genre, presence: true
	validates :price, presence: true, numericality: {only_integer: true}
	validates :is_active, presence: true
	has_many :cart_items, dependent: :destroy
	belongs_to :genre
	attachment :image
end
