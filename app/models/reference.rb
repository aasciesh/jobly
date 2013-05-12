class Reference < ActiveRecord::Base
  attr_accessible :email, :phone, :referee_info, :referee_name, :user_profile_id, :application_id
  belongs_to :user_profile
  has_many :application_references
  has_many :applications, through: :application_references
  validates :email, presence: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 
  validates :referee_name, presence: true

end
