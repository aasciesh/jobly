class Application < ActiveRecord::Base
  attr_accessible :user_id, :vacancy_id

  belongs_to :user_profile
  belongs_to :vacancy
end
