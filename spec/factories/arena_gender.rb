
FactoryGirl.define do
  factory :ArenaGender do
    name 'Male'
    factory :female, class:ArenaGender do
      name 'Female'
    end
  end
end