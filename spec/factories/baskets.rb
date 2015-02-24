FactoryGirl.define do
  factory :basket do
    notice "MyString"
    amount "9.99"
    document ""
    user nil
    payment nil
    vendor nil
  end
end
