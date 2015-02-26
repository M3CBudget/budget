FactoryGirl.define do
  category = FactoryGirl.create(:category)
  factory :item do
    basket_id 1
    category_id 1
    article nil
    user nil
    name 'Milch'
    quantity 5
    price 1000.99
    notice 'Dies ist meine Milch'
    income false
    period 1
    launch "25.02.2015"
    finish "25.02.2015"
  end
end
