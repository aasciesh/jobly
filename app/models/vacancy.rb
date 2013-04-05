class Vacancy < ActiveRecord::Base
  attr_accessible :city, :country, :deadline, :description, :job_address, :job_type, :latitude, :longitude, :street, :title, :zip

  belongs_to :category
  belongs_to :company_profile
  has_many :applications, foreign_key: 'vacancy_id'
  has_many :tag_matches
  has_many :tags, through: :tag_matches

  JOB_TYPES = ['fulltime','part time','traineeship','fixed term']

  validates :title, presence: true, length: {minimum: 5, maximum: 150}
  validates :description, presence: true, length: {minimum:10, maximum: 3000}
  validates	:deadline, presence: true
  validate :is_deadline_after_creation_date?
  validates :job_type, presence: true, inclusion: {in: JOB_TYPES}
  validates :job_address, presence: true, length: {maximum: 200}

  def is_deadline_after_creation_date?
  	if self.deadline > DateTime.now
  		return true
  	else
  		return false
  	end
  end
end
