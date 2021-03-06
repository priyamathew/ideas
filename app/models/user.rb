class User < ActiveRecord::Base
  has_many :ideas, foreign_key: "creator_id"
  has_many :votes, foreign_key: "voter_id"
  has_many :usergroups
  has_many :groups, through: :usergroups
  has_many :admingroups, :class_name => "Group", :foreign_key => :admin_id
  validates_uniqueness_of :email
  validates_presence_of :email, :name, :password

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(entered_password)
    password == entered_password
  end

end

