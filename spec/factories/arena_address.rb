
FactoryGirl.define do
  factory :ArenaAddress do
    address_id 1
    date_created (Time.new)
    date_modified (Time.new)
    created_by 'created by'
    modified_by 'modified by'
    street_address_1 '1234 main st'
    street_address_2 '2 apt'
    city 'Post Falls'
    state 'Idaho'
    postal_code '83854'
    Latitude 1.24234
    Longitude 1.3232
    standardize_code 1
    standardize_msg 'message'
    XAxis 1.1241
    YAxis 1.1233
    ZAxis 12.231
    date_geocoded Time.new
    date_standardized Time.new
    geocode_service 'geo_service'
    geocode_status 1
    route 'route'
    dpbc 'dpbc'
    lot 'lot'
    endorsement_line 'endorsement_line'
    container_label 'container label'
    country 'US'
  end
end