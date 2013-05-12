class Vacancy < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  attr_accessible :city, :country, :deadline, :description, :job_address, 
  					:job_type, :latitude, :longitude, :street, :title, :zip, 
					:min_salary, :max_salary, :job_duration, :application_attributes

  geocoded_by :job_address do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.zip = geo.postal_code
      obj.country = geo.country
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  
  after_validation :geocode,
  :if => lambda{ |obj| obj.job_address_changed? }

  belongs_to :category
  belongs_to :company_profile
  has_many :applications, foreign_key: 'vacancy_id'
  has_many :tag_matches
  has_many :tags, through: :tag_matches

  accepts_nested_attributes_for :applications

  JOB_TYPES = ['full-time','part-time','shift','weekend']
  JOB_DURATION = ['less than 3 months','3 to 12 months','more than 12 months','summer',]
  
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

  mapping do 
    indexes :id, type: 'integer', index: 'no'
    indexes :title, boost: 15, analysis: 'snowball'
    indexes :description, boost: 10, analysis: 'keyword'
    indexes :job_type, index: 'no'
    indexes :job_duration , index: 'no'
    indexes :job_address, index: 'no'
    indexes :min_salary, index: 'no'
    indexes :max_salary, index: 'no'
    indexes :deadline, index: 'no'
    indexes :location, type: 'geo_point'
    indexes :category, index: 'no'
    indexes :company_name, boost: 5, analysis: 'snowball'
    indexes :company_id, type: 'integer'
    indexes :company_logo_url, index:'no'
  end

  def self.search(params)
    
    location = (Geocoder.search(params[:place])[0].coordinates if params[:place] )
    location.reverse!
    distance_filter = params[:distance] || '50km' 

    tire.search(page: params[:page]|| 1, per_page: 10) do
      query do
        boolean do
          must { string params[:query]} if params[:query].present?
        end
      end
      filter 'geo_distance', distance: distance_filter, location: location if location.present?
      highlight :title, :description, options:{ tag: '<strong class="highlight">' }
      sort {by _geo_distance: {location: location, order: 'asc'}} unless location.nil?
      
    end
  end

  def to_indexed_json
     to_json(
      only: ['id', 'title', 'description', 'job_type','job_duration','job_address','min_salary','max_salary','deadline'],
      methods: [:company_name, :company_id, :company_logo_url, :location]
    )
  end

  def company_name
    self.company_profile.name
  end
  def company_id
    self.company_profile.id
  end
  def company_logo_url
    self.company_profile.logo(:thumb)
  end
  def location
    [latitude, longitude].join(',')
  end
end
