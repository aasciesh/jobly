class AddAttachmentToCompanyProfile < ActiveRecord::Migration
   def self.up
    add_attachment :company_profiles, :banner
	end

  def self.down
    remove_attachment :company_profiles, :banner
	end
end
