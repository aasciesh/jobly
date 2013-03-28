class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :rememeber_cookie

  belongs_to :auth_credential, :polymorphic => true
end
