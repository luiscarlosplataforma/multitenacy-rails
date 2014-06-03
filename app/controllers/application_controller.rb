class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_site

  def set_current_site

    current_ip = "190.110.156.23"

    datfile = "/usr/local/share/GeoIP/GeoLiteCity.dat"
    c = GeoIP.new(datfile)
    geoinfo = c.city(current_ip)

    if !geoinfo["city_name"].blank?
      current_site = Site.where(:name => geoinfo["city_name"]).first
    elsif !geoinfo["country_code2"].blank?
      current_site = Site.where(:country_code => geoinfo["country_code2"]).first
    else
      current_site = Site.find("5384f91cef73584bbd000001")
    end

    puts geoinfo.to_json
    puts current_site.to_json

    I18n.locale = current_site.locale || I18n.default_locale

    Mongoid::Multitenancy.current_tenant = current_site
    prepend_view_path "app/views/#{current_site.view_path}"
  end
end
