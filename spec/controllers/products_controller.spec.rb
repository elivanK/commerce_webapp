require 'rails_helper'

# Write tests for all actions in your ProductsController
describe ProductsController, type: :controller do

    # before do 
    #     @product = FactoryBot.create()
    # end    

    # Make sure the controller successfully responds to
    # a browser request.
    context "GET #index" do
        it "responsed successfully" do
            get :index
            expect(response).to be_success
        end      
    end




end