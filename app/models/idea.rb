class Idea < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_one :group, through: :user
  has_many :votes, dependent: :destroy #delete all votes for idea if idea is deleted
end
