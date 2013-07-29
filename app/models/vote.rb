class Vote < ActiveRecord::Base
  belong_to :idea
  belong_to :voter, class_name: "User"
end
