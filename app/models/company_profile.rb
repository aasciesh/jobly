class CompanyProfile < ActiveRecord::Base
  attr_accessible :city, :contact, :country, :description, :logo, :name, :street, :type, :website, :zip

  has_attached_file :logo
  has_one :user, as: :profile
  has_many :vacancies


end
