
FactoryGirl.define do
  factory :ArenaGender do
    id 1
    name 'Male'
    factory :female, class:ArenaGender do
      id 2
      name 'Female'
    end
  end
end