# Tell rails that you are using FactoryBot to define factories
FactoryBot.define do 
    # Create another factory for admin using sequence
    sequence(:email) { |n| "user#{n}@example.com"}
    # Here we define the first factory
    factory :user do
        email 
        password "123456"
        first_name "Peter"
        last_name "Example"
        admin false
    end 

    factory :admin, class: User do
        email
        password "123456"
        first_name "Jon"
        last_name "Doe"
        admin true
    end
end