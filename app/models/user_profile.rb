class UserProfile < ActiveRecord::Base
  attr_accessible 	:avatar, :birth_date, :city, :country, 
  					:firstname, :full_address, :gender, :hobbies, 
  					:lastname, :self_info, :street, :zip, :user_attributes

  has_one :user, as: :profile
  accepts_nested_attributes_for :user
  has_attached_file :avatar

 
  has_many :applications
  has_many :experiences
  has_many :qualifications
  has_many :language_skills
  has_many :references

USER_GENDER_TYPE= ['m','f']

  validates :firstname, presence: true, length: {minimum: 2, maximum: 50}
  validates :lastname, presence: true, length: {minimum: 2, maximum: 50}
  validates :country, presence: true, length: {minimum: 2, maximum: 50, message: 'Give country name'}
  validate :is_birth_date_given_and_is_above_16?
  # validates :birth_date, presence: true, message: 'birth date above 16'
  validates :gender, presence:true, inclusion: {in: USER_GENDER_TYPE, message: 'User type must be m or f'}
  validates :full_address, presence: true, length: {minimum: 2, maximum: 250}

  private

  def is_birth_date_given_and_is_above_16?
    if self.birth_date.nil?
        errors.add(:birth_date, "must be given")
        return false
    elsif self.birth_date <= (DateTime.now-16.years)
        return true
    elsif self.birth_date > (DateTime.now-16.years)
      errors.add(:birth_date, "must be atleast 16.")
      return false
    end
  end
end
