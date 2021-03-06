class Place
  include Mongoid::Document
  include Mongoid::Multitenancy::Document

  tenant(:site)

  field :name, :type => String
  field :description, :type => String
end
