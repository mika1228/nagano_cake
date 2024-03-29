class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    self.last_name + " " + self.first_name
  end

  has_many :orders
  has_many :addresses
  has_many :cart_items
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
