class Geolocation
  GEOLOCATION_PATH = "/geolocation.json"

  getLocation: ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition saveGeolocation, deleteGeolocation

  saveGeolocation = (position) ->
    $.ajax
      url: GEOLOCATION_PATH
      type: "PUT"
      dataType: "json"
      data:
        geolocation:
          latitude: position.coords.latitude
          longitude: position.coords.longitude

  deleteGeolocation = ->
    $.ajax
      url: GEOLOCATION_PATH
      type: "DELETE"
      dataType: "json"

geolocation = new Geolocation
geolocation.getLocation()
