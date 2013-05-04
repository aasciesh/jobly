class CompanyProfile < ActiveRecord::Base
  attr_accessible 	:city, :contact, :country, :description, 
  					:logo_file_name, :name, :street, :company_type, 
  					:website, :zip, :logo, :user_attributes
 validates 	:description, 
 			:presence=>true, 
 			:length => {:minimum => 15 , :maximum=>3000}
 validates 	:name, 
 			:presence=>true, 
 			:length => {:minimum => 3 , :maximum=>120}
 validates 	:contact, 
 			:length => {:maximum=>2000}
 
  has_attached_file :logo, :styles => { profile_pic: "210x210#", cv_pic: "110x110#", thumb: "40x40#" }
  has_one :user, as: :profile
  accepts_nested_attributes_for :user
  has_many :vacancies

end
