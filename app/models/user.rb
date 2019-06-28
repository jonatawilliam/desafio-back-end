class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, 
    :rememberable, :validatable, :omniauthable
  
  has_many :financial_movements
  
  def self.from_omniauth(user_auth)
    where(provider: user_auth.provider, uid: user_auth.uid).first_or_create do |user|
      user.uid = user_auth.uid
      user.provider = user_auth.provider
      user.email = user_auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
