class UserProfile < ActiveRecord::Base
  attr_accessible :avatar, :birth_date, :city, :country, :firstname, :full_address, :gender, :hobbies, :lastname, :self_info, :street, :zip

  
  has_attached_file :avatar

  has_one :user, as: :profile
  has_many :applications
  has_many :experiences
  has_many :qualifications
  has_many :language_skills
  has_many :references

end
