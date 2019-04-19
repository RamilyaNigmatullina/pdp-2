Geocoder.configure(lookup: :test, ip_lookup: :test)

Geocoder::Lookup::Test.set_default_stub(
  [{
    "coordinates" => [55.7887, 49.1221],
    "address" => "Russia, Republic of Tatarstan, City of Kazan, Vakhitovskiy District, Profsoyuznaya Street, 23В/12"
  }]
)
