Geocoder.configure(lookup: :test, ip_lookup: :test)

module GeocoderHelpers
  def stub_geocoder(query, result)
    Geocoder::Lookup::Test.add_stub(query, [ result ])
  end
end

RSpec.configure do |config|
  config.include GeocoderHelpers
end
