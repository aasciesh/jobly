class CompanyProfile < ActiveRecord::Base
  attr_accessible 	:city, :contact, :country, :description, 
  					:logo_file_name, :name, :street, :company_type, 
  					:website, :zip, :logo, :user_attributes
 validates 	:description, 
 			:presence=>true, 
 			:length => {:minimum => 15 , :maximum=>3000}
 validates 	:name, 
 			:presence=>true, 
 			:length => {:minimum => 3 , :maximum=>120},
 			:uniqueness => true
 validates 	:contact, 
 			:length => {:maximum=>2000}
 
 # Changed imagemagick geometry parameter, because company logo's cannot be cropped, only it is being resized. Only for thumb it is cropped.
  has_attached_file :logo, :styles => { profile_pic: "x210", medium: "x110", thumb: "40x40#" }, default_url: "/assets/default_pics/co-:style.png"
  has_one :user, as: :profile
  accepts_nested_attributes_for :user
  has_many :vacancies

  extend FriendlyId
  friendly_id :name, use: :slugged
  

 



end
