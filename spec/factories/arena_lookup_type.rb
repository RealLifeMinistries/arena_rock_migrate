
FactoryGirl.define do
  factory :SmallGroupLookupType, aliases:[:lookup_type], class: :ArenaLookupType do |u|
    u.sequence(:lookup_type_id)
    u.sequence(:guid) { SecureRandom.uuid }
    lookup_type_name 'Small Group Role'
    lookup_type_desc 'The types of roles available for members in a group.<br/><br/>To give people in a particular role the ability to access the Leader Toolbox, enter allowedit as the Security Indicator.'
    qualifier_1_title 'Security Indicator'
  end
end