class Idea < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :group
  has_many :votes, dependent: :destroy #delete all votes for idea if idea is deleted

  def vote_count
    self.votes.count
  end
end
