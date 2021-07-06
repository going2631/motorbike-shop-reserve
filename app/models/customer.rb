class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
end
