class User < ActiveRecord::Base
  has_many :ideas
  has_many :votes
  belongs_to :group
end
