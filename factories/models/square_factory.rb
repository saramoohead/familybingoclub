FactoryGirl.define do
  factory :square do
    sequence :code do |n|
      "N0#{n}"
    end
  end
end