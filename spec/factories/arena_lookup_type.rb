
FactoryGirl.define do
  factory :SmallGroupLookupType, aliases:[:lookup_type], class: :ArenaLookupType do |u|
    u.sequence(:lookup_type_id)
    u.sequence(:guid) { SecureRandom.uuid }
    lookup_type_name 'Small Group Role'
    lookup_type_desc 'The types of roles available for members in a group.<br/><br/>To give people in a particular role the ability to access the Leader Toolbox, enter allowedit as the Security Indicator.'
    qualifier_1_title 'Security Indicator'
    factory :AddressLookupType do
      lookup_type_name 'Address Type'
      lookup_type_desc "Type of Address available for each person.  Entering 'propogate' for a particular type will cause the value for that address to be automatically entered for additional family members when entered for one family member."
      qualifier_1_title 'Propogation'
    end
  end
end