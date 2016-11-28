class Survey < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user
end