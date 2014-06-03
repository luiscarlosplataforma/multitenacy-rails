class PlaceEnabledFields
  attr_accessor :result

  def initialize(place_module)
    @place_module = place_module
  end

  def process
    current_tenant = Mongoid::Multitenancy.current_tenant

  end
end