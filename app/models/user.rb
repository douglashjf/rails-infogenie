class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cards
  has_many :favourites
  has_many :user_categories
  has_many :comments
  has_many :categories, through: :user_categories

  validates :first_name, :last_name, presence: true

end
