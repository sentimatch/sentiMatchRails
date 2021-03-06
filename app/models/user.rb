class User < ActiveRecord::Base

	include Concerns::Users::CheckedinUsers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_token :uauth_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :auth_token, :auth_secret, :password, :email 
end
