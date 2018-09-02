FactoryBot.define do
    factory :comment, class: Comment do
      body "Amazing"
      rating "1"
      user
      product
  end
end 