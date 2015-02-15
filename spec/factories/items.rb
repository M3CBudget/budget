FactoryGirl.define do
  factory :item do
    basket nil
category nil
article nil
user nil
name "MyString"
quantity "9.99"
notice "MyString"
income false
expense false
period 1
launch "2015-02-15"
finish "2015-02-15"
  end

end
