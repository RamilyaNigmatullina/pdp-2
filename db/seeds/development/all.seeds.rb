FactoryGirl.create(:user, email: "user@example.com")
FactoryGirl.create(:user, :admin, email: "admin@example.com")

city = FactoryGirl.create(:city, name: "Kazan")
city_2 = FactoryGirl.create(:city, name: "Moscow")

FactoryGirl.create(:hotel, city: city, name: "Hotel complex Tatarstan", address: "Pushkin str. 4, Kazan",
  longitude: 49.12240500000007, latitude: 55.786463, rating: 7.4, stars: 3)
FactoryGirl.create(:hotel, city: city, name: "Hotel Nogai", address: "Profsoyuznaya str. 16B, Kazan",
  longitude: 49.11462860000006, latitude: 55.7919311, rating: 9.1, stars: 3)
FactoryGirl.create(:hotel, city: city, name: "Hotel Prestige House Verona", address: "Narimanov str. 63, Kazan",
  longitude: 49.109822099999974, latitude: 55.781017, rating: 7.5, stars: 3)
FactoryGirl.create(:hotel, city: city, name: "Hotel Art", address: "Ostrovsky str. 33, Kazan",
  longitude: 49.118267999999944, latitude: 55.787705, rating: 8.4, stars: 4)
FactoryGirl.create(:hotel, city: city, name: "Hotel Osobnyak na Teatralnoy", address: "Teatralnaya str. 3, Kazan",
  longitude: 49.123834699999975, latitude: 55.79550219999999, rating: 8.2, stars: 3)
FactoryGirl.create(:hotel, city: city, name: "Kolvi", address: "Mikhail Khudyakov ln. 7, Kazan",
  longitude: 49.11200789999998, latitude: 55.78301, rating: 8.1, stars: 2)
FactoryGirl.create(:hotel, city: city, name: "Hotel Korston Tower", address: "N. Ershov str. 1A, Kazan",
  longitude: 49.14956600000005, latitude: 55.793874, rating: 8.7, stars: 4)
FactoryGirl.create(:hotel, city: city, name: "Grand Hotel Kazan", address: "St. Petersburg str. 1, Kazan",
  longitude: 49.124256100000025, latitude: 55.78646999999999, rating: 8.3, stars: 4)
FactoryGirl.create(:hotel, city: city_2, name: "AZIMUT Hotel Olympic Moscow", address: "Olympic ave. 18/1, Moscow",
  longitude: 37.62303159999999, latitude: 55.7853487, rating: 9.2, stars: 4)
