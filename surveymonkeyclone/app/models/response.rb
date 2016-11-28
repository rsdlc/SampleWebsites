class Response < ActiveRecord::Base
  has_many :relations
  has_many :options, through: :relations
  belongs_to :participation
end