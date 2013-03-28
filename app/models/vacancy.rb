class Vacancy < ActiveRecord::Base
  attr_accessible :city, :country, :deadline, :description, :job_address, :job_type, :latitude, :longitude, :street, :title, :zip

  belongs_to :sub_category
  belongs_to :company_profile
  has_many :applications
  
end
