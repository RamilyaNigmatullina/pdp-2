# module WebmockHelpers
#   module GoogleApis
#     RESPONSE_BODY = {
#       dstOffset: 0,
#       rawOffset: 10800,
#       status: "OK",
#       timeZoneId: "Europe/Moscow",
#       timeZoneName: "Moscow Standard Time 2"
#     }.freeze
#
#     def stub_google_apis
#       binding.pry
#       stub_request(:get, %r{maps.googleapis.com}).to_return(status: 201, body: RESPONSE_BODY.to_json)
#     end
#   end
# end
