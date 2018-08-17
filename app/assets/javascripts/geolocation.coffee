class Geolocation
  getLocation: ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition saveGeolocation, deleteGeolocation

  saveGeolocation = (position) ->
    setCookie("latitude", position.coords.latitude, 100)
    setCookie("longitude", position.coords.longitude, 100)

  deleteGeolocation = ->
    setCookie("latitude", "", 0)
    setCookie("longitude", "", 0)

  setCookie = (name, value, expires_msec) ->
    document.cookie = name + "=" + value + ";expires=" + expires_msec

geolocation = new Geolocation
geolocation.getLocation()
