require 'rails/source_annotation_extractor'
class DevelopmentController < ApplicationController
	def index
		all_folders = %w(app config lib script test)
    	folders_path= all_folders.map do |name|
    						File.join(Rails.root, name)
    					end
      
      @todo_notes = SourceAnnotationExtractor.new("TODO").find(folders_path)
      @fixme_notes =  SourceAnnotationExtractor.new("FIXME").find(folders_path)
      @optimize_notes = SourceAnnotationExtractor.new("OPTIMIZE").find(folders_path)
      
	end
end
