FactoryGirl.define do 
  factory :user do 
    name { Faker::Name.name }
    city { Faker::Address.city }
  end

  factory :post do 
    user
    title { Faker::Company.catch_phrase }
    content { Faker::Lorem.paragraph(9) }
  end

  factory :image do 
    url { Faker::Company.logo }
    post
  end

  factory :comment do 
    user
    post
  end
end
