require 'rails_helper'

describe Product do
    context "when the product has comments" do
        # Here we create a product
        let(:product) { Product.create!(name: "race bike") }
        # Here we create a new user 
        let(:user) { User.create!(email: "test@test.com", password: "test123") }
        # We use before instead of a let since we won't need to access these 
        # comments directly:
        before do
            product.comments.create!(rating: 1, user: user, body: "Awful bike!")
            product.comments.create!(rating: 3, user: user, body: "Ok bike!")
            product.comments.create!(rating: 5, user: user, body: "Great bike!")    
        end

        it "returns the average rating of all comments" do
            expect(product.average_rating).to eq 3.0
        end

        it "is not valid without a name" do
            expect(Product.new(description: "Nice bike")).not_to be_valid
         end
    end
end
