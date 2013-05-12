class ApplicationReference < ActiveRecord::Base
  attr_accessible :application_id, :reference_id
  belongs_to :application
  belongs_to :reference
end
