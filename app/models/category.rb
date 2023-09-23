class Category < ApplicationRecord
  has_many :user_categories
  has_many :card_categories

  has_many :users, through: :user_categories
  has_many :cards, through: :card_categories

end
