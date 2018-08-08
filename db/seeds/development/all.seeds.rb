FactoryGirl.create(:user, email: "user@example.com")

city = FactoryGirl.create(:city, name: "Казань")
city_2 = FactoryGirl.create(:city, name: "Москва")

FactoryGirl.create(:hotel, city: city, name: "Гостиничный комплекс Татарстан", address: "г. Казань, ул. Пушкина, 4",
  longitude: 49.12240500000007, latitude: 55.786463, rating: 7.4, stars: 3,
  check_in_time: "30.09.2018 14:00:30".to_datetime)
FactoryGirl.create(:hotel, city: city, name: "Отель НОГАЙ", address: "г. Казань, ул. Профсоюзная улица, 16Б",
  longitude: 49.11462860000006, latitude: 55.7919311, rating: 9.1, stars: 3,
  check_in_time: "30.09.2018 10:00:30".to_datetime)
FactoryGirl.create(:hotel, city: city, name: "Гостиница Prestige House Verona", address: "г. Казань, ул. Нариманова, 63",
  longitude: 49.109822099999974, latitude: 55.781017, rating: 7.5, stars: 3,
  check_in_time: "30.09.2018 10:00:30".to_datetime)
FactoryGirl.create(:hotel, city: city, name: "Отель Арт", address: "г. Казань, ул. Островского, 33",
  longitude: 49.118267999999944, latitude: 55.787705, rating: 8.4, stars: 4,
  check_in_time: "30.09.2018 12:00:30".to_datetime)
FactoryGirl.create(:hotel, city: city, name: "Гостиница Особняк на Театральной", address: "г. Казань, ул. Театральная, 3",
  longitude: 49.123834699999975, latitude: 55.79550219999999, rating: 8.2, stars: 3,
  check_in_time: "30.09.2018 17:00:30".to_datetime)
FactoryGirl.create(:hotel, city: city, name: "Колви", address: "г. Казань, пер. Михаила Худякова, 7",
  longitude: 49.11200789999998, latitude: 55.78301, rating: 8.1, stars: 2,
  check_in_time: "30.09.2018 14:00:30".to_datetime)
FactoryGirl.create(:hotel, city: city, name: "Отель Korston Tower", address: "г. Казань, ул. Н. Ершова, 1А",
  longitude: 49.14956600000005, latitude: 55.793874, rating: 8.7, stars: 4,
  check_in_time: "30.09.2018 14:00:30".to_datetime)
FactoryGirl.create(:hotel, city: city, name: "Гранд Отель Казань", address: "г. Казань, ул. Петербургская, 1",
  longitude: 49.124256100000025, latitude: 55.78646999999999, rating: 8.3, stars: 4,
  check_in_time: "30.09.2018 14:00:30".to_datetime)
FactoryGirl.create(:hotel, city: city_2, name: "AZIMUT Отель Олимпик Москва", address: "г. Москва, Олимпийский пр., 18/1",
  longitude: 37.62303159999999, latitude: 55.7853487, rating: 9.2, stars: 4,
  check_in_time: "30.09.2018 10:00:30".to_datetime)
