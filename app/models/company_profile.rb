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
 
 # Changed imagemagick geometry parameter, because company logo's cannot be cropped, only it is being resized. Only for thumb it is cropped.
  has_attached_file :logo, :styles => { profile_pic: "x210", medium: "x110", thumb: "40x40#" }
  has_one :user, as: :profile
  accepts_nested_attributes_for :user
  has_many :vacancies

  extend FriendlyId
  friendly_id :name, use: :slugged
  

 


  def logo(style)
    case style
    when :profile_pic
      return ('/assets/default_pics/co-210.png' unless self.logo? ) || self.logo(:profile_pic)
  	when :medium
      return ('/assets/default_pics/co-110.png' unless self.logo? ) || self.logo(:medium)
    when :thumb
      return ('/assets/default_pics/co-40.png' unless self.logo? ) || self.logo(:thumb)
    else
      return '/assets/default_pics/user-110.png'
    end
  end


end
