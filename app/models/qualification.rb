class Qualification < ActiveRecord::Base
  attr_accessible :address, :degree_type, :end, :institute_name, :start, :website

  belongs_to :user_profile

  validates :address, presence: true
  validates :degree_type, presence: true  
  validates :start, presence: true
  validates :institute_name, presence: true
end
