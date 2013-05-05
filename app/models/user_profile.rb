class UserProfile < ActiveRecord::Base
  attr_accessible   :avatar, :birth_date, :city, :country, 
            :firstname, :full_address, :gender, :hobbies, 
            :lastname, :self_info, :street, :zip, :user_attributes, :qualification_attributes


  has_attached_file :avatar, :styles => { profile_pic: "210x210#", cv_pic: "110x110#", thumb: "40x40#" }
  has_one :user, as: :profile
  accepts_nested_attributes_for :user

 
  has_many :applications
  has_many :experiences
  has_many :qualifications
  has_many :language_skills
  has_many :references

  accepts_nested_attributes_for :user, :qualifications
  USER_GENDER_TYPE= ['Male','Female']

  validates :firstname, presence: true, length: {minimum: 2, maximum: 50}
  validates :lastname, presence: true, length: {minimum: 2, maximum: 50}
  validates :country, length: {minimum: 2, maximum: 50, message: 'Give country name'}, allow_blank: true
  validate :is_birth_date_given_and_is_above_16?
  validates :gender, inclusion: {in: USER_GENDER_TYPE, message: 'User type must be Male or Female'}, allow_blank: true
  validates :full_address, presence: true, length: {minimum: 2, maximum: 250}

  private

  def is_birth_date_given_and_is_above_16?
    if self.birth_date.nil?
        return true
    elsif self.birth_date <= (DateTime.now-16.years)
        return true
    elsif self.birth_date > (DateTime.now-16.years)
      errors.add(:birth_date, "must be atleast 16.")
      return false
    end
  end

end
