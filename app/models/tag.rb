class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :tag_matches
  has_many :vacancies, through: :tag_matches
end
