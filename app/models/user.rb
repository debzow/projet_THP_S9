class User < ApplicationRecord
  # Include default devise modules. Others available are:
  validates :admin, presence: true
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable      
  #un user peux passer plusieurs commandes.
  has_many :orders

  #create a cart associate to the new user
  after_create do
    Cart.create(user_id: self.id)
  end
end
