class Vacancy < ActiveRecord::Base
  attr_accessible :city, :country, :deadline, :description, :job_address, 
  					:job_type, :latitude, :longitude, :street, :title, :zip, 
					:min_salary, :max_salary, :job_duration

  belongs_to :category
  belongs_to :company_profile
  has_many :applications, foreign_key: 'vacancy_id'
  has_many :tag_matches
  has_many :tags, through: :tag_matches

  JOB_TYPES = ['full-time','part-time','shift','weekend']
  JOB_DURATION = ['lt3','3to12','gt12','s']
  
  validates :title, presence: true, length: {minimum: 5, maximum: 150}
  validates :description, presence: true, length: {minimum:10, maximum: 3000}
  validate :is_deadline_after_creation_date?
  validates :job_type, presence: true, inclusion: {in: JOB_TYPES, message: 'Job type must be either fulltime part-time traineeship or fixed-term'}
  validates :job_duration, presence: true, inclusion: {in: JOB_DURATION, message: 'Duration must be choosen'}
  validates :job_address, presence: true, length: {maximum: 200}
  validates :min_salary, numericality: true
  validates :max_salary, numericality: true
  validates	:deadline, presence: true

  def is_deadline_after_creation_date?
  	if self.deadline > DateTime.now
  		return true
  	else
  		errors.add(:deadline, "must be after creation date.")
  		return false
  	end
  end
end
