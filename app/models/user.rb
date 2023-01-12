class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :trackable

  has_many :tweets, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }, allow_blank: true
end
