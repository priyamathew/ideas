class Vote < ActiveRecord::Base
  belongs_to :idea
  belongs_to :voter, class_name: "User"
  # validates :voter_id, uniqueness => {:scope => :idea_id}
end
