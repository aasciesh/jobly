class Reference < ActiveRecord::Base
  attr_accessible :email, :phone, :referee_info, :referee_name

  belongs_to :user_profile
end
