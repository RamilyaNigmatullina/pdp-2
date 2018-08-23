shared_context :stubbed_geolocation do
  Geocoder::Lookup::Test.add_stub(
    "Kazan", [
      {
        "coordinates"  => [55.7887, 49.1221],
        "address"      => "Russia, Republic of Tatarstan, City of Kazan, Vakhitovskiy District, Profsoyuznaya Street, 23В/12",
        "state"        => "Republic of Tatarstan",
        "state_code"   => "",
        "country"      => "Russia",
        "country_code" => "RU"
      }
    ]
  )
end
