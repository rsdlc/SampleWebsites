class Order < ActiveRecord::Base
  has_many :cakes
  belongs_to :user
end
