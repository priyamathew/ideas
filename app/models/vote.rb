class Vote < ActiveRecord::Base
  belongs_to :idea
  belongs_to :voter, class_name: "User"
end
