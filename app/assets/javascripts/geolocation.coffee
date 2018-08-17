class Geolocation
  getLocation: ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition saveGeolocation, deleteGeolocation

  saveGeolocation = (position) ->
    Cookies.set("latitude", position.coords.longitude, { expires: 100, path: "/" })
    Cookies.set("longitude", position.coords.longitude, { expires: 100, path: "/" })

  deleteGeolocation = ->
    Cookies.remove("latitude", { path: "" })
    Cookies.remove("longitude", { path: "" })

geolocation = new Geolocation
geolocation.getLocation()
