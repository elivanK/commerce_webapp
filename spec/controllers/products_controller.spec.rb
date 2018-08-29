require 'rails_helper'

# Write tests for all actions in your ProductsController
describe ProductsController, type: :controller do
    # Make sure the controller successfully responds to
    # a browser request.
    describe "#index" do
        it "respnds successfully" do
            get :index
            expect(response).to be_success
        end      
    end




end