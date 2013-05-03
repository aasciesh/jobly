class Experience < ActiveRecord::Base
  attr_accessible :business_field, :employer, :end_date, 
  :full_address, :position, :responsibilities, :start_date

  belongs_to :user_profile

  validates :full_address, presence:true, length:{minimum: 5, maximum: 50}
  validates :employer, presence:true, length:{minimum: 3, maximum: 50} 
  validates :position, presence:true, length:{minimum:5, maximum:50}
  validates :business_field, presence:true, length:{minimum:5, maximum:50}	
  validates :responsibilities, presence:true, length:{minimum:5, maximum:250}	 
  validate :start_date, presence:true
  validate :is_end_date_after_start_date?

  def is_end_date_after_start_date?
  		if self.start_date.nil?
  			errors.add(:start_date,"must not be nil")
  			return false
  		elsif self.end_date.nil?
  			return true
  		elsif self.end_date > self.start_date
  			return true
  		elsif self.start_date <= self.end_date
  			errors.add(:end_date, "must be after start date")
  			return false
  		end
  	end  
end
