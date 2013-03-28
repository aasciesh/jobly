class Qualification < ActiveRecord::Base
  attr_accessible :address, :degree_type, :end, :institute_name, :start, :website

  belongs_to :user_profile
end
