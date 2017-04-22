FactoryGirl.define do
  factory :board do
    sequence :code do |n|
      "B0000#{n}"
    end
  end
end