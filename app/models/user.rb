class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_cookie, :activated, :confirmation_sent_date, :confirmation_code

  has_secure_password
   has_attached_file :avatar, :styles => { profile_pic: "210x210#", cv_pic: "110x110#", thumb: "40x40#" }
  belongs_to :profile, :polymorphic => true

  USER_TYPES = ['c','u']


  validates :email, uniqueness: true, presence: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 
  validates :password, presence: true, length: { :in => 8..20 , message: 'user password must be between 8 and 20 characters'}
  validates :password_confirmation, presence: true 
  
  before_save {|user| user.remember_cookie = SecureRandom.urlsafe_base64}
  before_create {|user| user.confirmation_code = SecureRandom.hex
                        user.confirmation_sent_date = DateTime.now}
end
