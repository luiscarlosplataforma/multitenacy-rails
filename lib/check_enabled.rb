class CheckEnabled

  def initialize(object, element_type)
    @object = object
    @element_type = element_type
    @enabled_class = "Enabled#{@element_type}".constantize rescue nil
  end

  def check(element_name)
    return true if @enabled_class.nil?

    if @enabled_attributes.nil?
      result = @enabled_class.find_by(model: @object.class.to_s) rescue nil
      @enabled_attributes = result.model_attributes rescue []
    end

    return @enabled_attributes.include?(element_name.to_s)
  end
end
