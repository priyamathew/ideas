class Idea < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :group
  has_many :votes
end
