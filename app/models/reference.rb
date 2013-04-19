class Reference < ActiveRecord::Base
  attr_accessible :email, :phone, :referee_info, :referee_name

  belongs_to :user_profile
  validates :email, presence: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 
  validates :referee_name, presence: true
end
