class Delivery < ApplicationRecord
  belongs_to :customer

  validates :name,  presence: true
  validates :address, presence: true
  validates :post_number, format: /\A[0-9]+\z/
end
