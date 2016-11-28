class Option < ActiveRecord::Base
  belongs_to :question
  has_many :relations
  has_many :responses, through: :relations
end