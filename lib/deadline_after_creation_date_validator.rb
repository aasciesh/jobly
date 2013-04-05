class DeadlineAfterCreationDateValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless Time.now < value
      object.errors[attribute] << (options[:message] || "must be date after creation date.") 
    end
  end
end