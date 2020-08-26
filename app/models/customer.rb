class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :orders
  has_many :items, through: :cart_items
  has_many :deliveries, dependent: :destroy

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :post_number
    validates :address
    validates :phone_number
    validates :email
  end

  def full_name
    self.last_name + " " + self.first_name
  end


end
