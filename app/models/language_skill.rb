class LanguageSkill < ActiveRecord::Base
  attr_accessible :level, :name, :type

  belongs_to :user_profile
end
