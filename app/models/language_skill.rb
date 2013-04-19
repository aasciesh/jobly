class LanguageSkill < ActiveRecord::Base
  attr_accessible :level, :name, :type

  belongs_to :user_profile
  LANGUAGE_TYPES = ['spoken', 'written']

  validates :type, presence: true, inclusion: {in: LANGUAGE_TYPES, message: 'Language type must be spoken or written'}
  validates :name, presence:true, uniqueness: true
  validates :level, presence: true, :inclusion => { :in => 0..5 }
end
