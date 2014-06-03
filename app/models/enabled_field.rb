class EnabledField
  include Mongoid::Document
  include Mongoid::Multitenancy::Document

  tenant(:site)

  field :model, :type => String
  field :model_attributes, :type => Array
end
