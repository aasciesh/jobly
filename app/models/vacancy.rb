class Vacancy < ActiveRecord::Base
  attr_accessible :city, :country, :deadline, :description, :job_address, :job_type, :latitude, :longitude, :street, :title, :zip

  belongs_to :category
  belongs_to :company_profile
  has_many :applications, foreign_key: 'vacancy_id'
  has_many :tag_matches
  has_many :tags, through: :tag_matches
end
