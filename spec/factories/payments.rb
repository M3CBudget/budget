FactoryGirl.define do
  factory :payment do
    user nil
    number "DE123456789123456789123456789"
    bic "BIC12345678"
    active true
    name "Girokonto"
  end
end
