class Experience < ActiveRecord::Base
  attr_accessible :business_field, :employer, :end_date, :full_address, :position, :responsibilities, :start_date

  belongs_to :user_profile
  
end
