class TagMatch < ActiveRecord::Base
  attr_accessible :tag_id, :vacancy_id
   belongs_to :tag
   belongs_to :vacancy
end
