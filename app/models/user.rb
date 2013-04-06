class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :rememeber_cookie, :type

  has_secure_password
  belongs_to :profile, :polymorphic => true
end
