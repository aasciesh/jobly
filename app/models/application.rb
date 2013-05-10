class Application < ActiveRecord::Base
  attr_accessible :user_id, :vacancy_id, :bookmark

  belongs_to :user_profile, foreign_key: :user_id
  belongs_to :vacancy
  has_many :references

  validates :user_id, presence: true
  validates :vacancy_id, presence: true
end
