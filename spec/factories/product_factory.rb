FactoryBot.define do
    factory :product, class: Product do
        name "Speedy bike"
        description "fast and furious"
        image_url "https://www.speedy.de/wp-content/uploads/2017/03/speedy-bike-600.jpg"
        color "red like the devil"
        price "1500"
    end 
end 