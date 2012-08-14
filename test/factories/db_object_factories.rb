FactoryGirl.define do

  factory :db_object do
    sequence(:id)
    sequence(:name) {|n| "base_object-#{n}"}
  end

end
