require 'rails_helper'

describe Comment, :type => :model do 

    context "when a comment has validation" do

        it "is not valid without a body" do
            expect(Comment.new(body:nil)).not_to be_valid  
        end 

        it "is not valid without rating" do 
            expect(Comment.new(rating:nil)).not_to be_valid
        end 

        it "is not valid when not numerical" do
            expect(Comment.new(rating:"abc")).not_to be_valid
        end 
        
    end
end 