class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :rememeber_cookie, :user_type

  has_secure_password
  belongs_to :profile, :polymorphic => true

  USER_TYPES =['c','u']

  validates_presence_of :email
  validates_uniqueness_of :email  
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i 
  validates_length_of :password, minimum: 8
  validates_length_of :password, maximum: 20
  validates_presence_of :user_type
  validates_presence_of :password_confirmation
  
end
