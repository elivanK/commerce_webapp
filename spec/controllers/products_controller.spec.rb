require 'rails_helper'

# Write tests for all actions in your ProductsController
describe ProductsController, type: :controller do
    before do
        @product = FactoryBot.create(:product)
    end 

    context "GET #index" do
        it "renders the index template" do
            get :index
            expect(response).to be_ok
            expect(response).to render_template("index")
        end      
    end

    context "GET #show" do
        it "renders the show template" do
            get :show, params: {id: @product}
            expect(response).to be_ok
            expect(response).to render_template("show")
        end 
    end 

    context "GET #new" do
        it "render the new template" do
            get :new
            expect(response).to be_ok
            expect(response).to render_template("new")
        end
        
    end

    context "GET #edit" do
        it "render the edit template" do
            get :edit, params: { id: @product }
            expect(response).to be_ok
            expect(response).to render_template("edit")
        end 
    end
    
    context "POST #create" do
        it "successfully create a new product" do
          @product = FactoryBot.create(:product)
          expect(response).to be_successful    
        end 

        it "cannot create a new product" do
            expect(Product.new(price:nil)).not_to be_valid
        end 
    end

   context "PUT #update" do
        it "update a product" do
            @update = { color: "white"}
            put :update, params: {id: @product.id, product: @update}
            @product.reload
            expect(@product.color).to eq "white"
        end 
   end 

    context "DELETE #destroy" do
        it "delete a product" do
            delete :destroy, params: { id: @product }
            expect(response).to redirect_to products_path
        end 
    end 


end