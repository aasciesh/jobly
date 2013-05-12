class Application < ActiveRecord::Base
  attr_accessible :user_id, :vacancy_id, :bookmark, :cover_letter, :reference_ids

  belongs_to :user_profile, foreign_key: :user_id
  belongs_to :vacancy
  has_many :application_references
  has_many :references, through: :application_references

  validates :user_id, presence: true
  validates :vacancy_id, presence: true
end
