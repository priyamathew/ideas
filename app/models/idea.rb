class Idea < ActiveRecord::Base
  belong_to :creator, class_name: "User"
  belong_to :group
  has_many :votes
end
