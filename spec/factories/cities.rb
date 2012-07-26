# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    gold 1
    food 1
    population 1
    tax 1.5
    is_capital false
    coordinate "MyString"
  end
end
