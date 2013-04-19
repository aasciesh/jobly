class CompanyProfile < ActiveRecord::Base
  attr_accessible 	:city, :contact, :country, :description, 
  					:logo_file_name, :name, :street, :type, :website, :zip
 validates 	:description, 
 			:presence=>true, 
 			:length => {:minimum => 15 , :maximum=>3000}
 validates 	:name, 
 			:presence=>true, 
 			:length => {:minimum => 3 , :maximum=>120}
 validates 	:contact, 
 			:length => {:maximum=>2000}
 
  has_attached_file :logo
  has_one :user, as: :profile
  has_many :vacancies


end
