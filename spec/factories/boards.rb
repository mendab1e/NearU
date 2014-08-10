# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :board do
    text "Simple banner"
    full_text "Visit our website"
    url "http://lastfm2vk.ru"
    payed_until nil
    long 37.501953
    lat 55.80283
  end
end
