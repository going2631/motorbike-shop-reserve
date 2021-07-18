class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :telephone_number, presence: true
  validates :email, presence: true
  
  # いいね機能用のコード
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
end
