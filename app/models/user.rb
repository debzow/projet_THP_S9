class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable      
  #un user peux passer plusieurs commandes.
  has_many :orders
end
