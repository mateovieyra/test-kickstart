class Tournament < ActiveRecord::Base 
  has_and_belongs_to_many :teams 
  has_many :points 
  has_many :players, through: :points
  has_many :match_days
end