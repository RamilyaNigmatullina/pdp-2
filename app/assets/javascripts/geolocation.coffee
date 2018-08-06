class Geolocation
  geolocationPath = "/geolocations.json"

  getLocation: ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition saveGeolocation, deleteGeolocation

  saveGeolocation = (position) ->
    $.ajax
      url: geolocationPath
      type: "POST"
      dataType: "json"
      data:
        geolocation:
          latitude: position.coords.latitude
          longitude: position.coords.longitude

  deleteGeolocation = ->
    $.ajax
      url: geolocationPath
      type: "DELETE"
      dataType: "json"

geolocation = new Geolocation
geolocation.getLocation()
