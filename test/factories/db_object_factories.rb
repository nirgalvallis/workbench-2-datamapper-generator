FactoryGirl.define do

  factory :db_object, class: DbModel::DbObject do
    sequence(:id)
    sequence(:name) {|n| "base_object-#{n}"}
  end

  factory :database, class: DbModel::Database do
  end
  
  factory :table, class: DbModel::Table, parent: :db_object do
    sequence(:name) {|n|"table-#{n}"}
  end 
  
  factory :column, class: DbModel::Column, parent: :db_object do
    sequence(:name) {|n|"column-#{n}"}
  end
  
  factory :foreign_key, class: DbModel::ForeignKey do
    sequence(:name) {|n| "foreign_key-#{n}"}    
  end
  
  factory :index, class: DbModel::Index do
    sequence(:name) {|n| "index-#{n}"}    
  end
  
end
