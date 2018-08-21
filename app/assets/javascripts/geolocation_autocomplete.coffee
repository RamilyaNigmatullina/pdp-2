class GeolocationAutocomplete
  constructor: (el) ->
    @$el = $(el)
    @$addressInput = $("#hotel_address")
    @$longitudeInput = $("#hotel_longitude")
    @$latitudeInput = $("#hotel_latitude")

    @_bindings()

  _bindings: () ->
    @$addressInput.on "change", @_autocompleteGeolocation

  _autocompleteGeolocation: () =>
    $.ajax
      url: "/geolocation"
      dataType: "json"
      data:
        address:
          @$addressInput.val()
      success: (response) =>
        @$longitudeInput.val(response.longitude)
        @$latitudeInput.val(response.latitude)

new GeolocationAutocomplete(el) for el in $(".hotel-form")
