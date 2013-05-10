class Reference < ActiveRecord::Base
  attr_accessible :email, :phone, :referee_info, :referee_name, :application_id

  belongs_to :application
  validates :email, presence: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i } 
  validates :referee_name, presence: true
end
