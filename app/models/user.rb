class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_cookie, :type

  has_secure_password
  belongs_to :profile, :polymorphic => true

  USER_TYPES = ['c','u']

  validates :email, presence: true 
  validates :email, uniqueness: true 
  validates :email, presence: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 
  validates :password, presence: true, length: { :in => 8..20 , message: 'user password must be between 8 and 20 characters'}
  # validates :type, presence: true, inclusion: {in: USER_TYPES, message: 'User type must be c or u'}
  validates :password_confirmation, presence: true 
  
  before_save {|user| user.remember_cookie = SecureRandom.urlsafe_base64}

end
