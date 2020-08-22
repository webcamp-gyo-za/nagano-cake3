class Deliverie < ApplicationRecord
  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :post_number,  presence: true, format: {with: /\A\d{7}\z/}
  validates :address, presence: true

  belongs_to :customer
end
