class Category < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :relations
  has_many :users, through: :relations
end
