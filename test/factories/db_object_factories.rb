FactoryGirl.define do

  factory :db_object do
    sequence(:id)
    sequence(:name) {|n| "base_object-#{n}"}
  end

  factory :database do
  end
  
  factory :table, class: :table, parent: :db_object do
    sequence(:name) {|n|"table-#{n}"}
    
  end 
end
