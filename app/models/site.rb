class Site
  include Mongoid::Document
  
  field :name, :type => String
  field :country_code, :type => String
  field :locale, :type => String
end
