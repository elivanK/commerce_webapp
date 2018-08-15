require 'rails_helper'


describe UsersController, type: :controller do
    let(:user1) { User.create!(email: "test1@gmail.com", password: "123456") }
    let(:user2) { User.create!(email: "test2@gmail.com", password: "123456") }

    describe 'GET #show' do
        context 'when a user is logged in' do
           before(:each) do
            sign_in user1
           end 
           it 'load correct user details' do
            get :show, params: { id: user1.id }
            expect(response).to be_ok
            # This is checking that in our controller we set the 
            # @user instance variable to the expected user.
            expect(assigns(:user)).to eq user1
           end
        end

        context 'when a user is NOT logged in' do
            it 'redirects to login' do
            # We define the ID to be equal to the ID of the 
            # user we created earlier.
                get :show, params: { id: user1.id }
                expect(response).to redirect_to(new_user_session_path)  

            end
        end
        context 'when a first user that is logged in can NOT access the show page of the second user' do
            before(:each) do
                sign_in user2
            end
            it 'redirect to home' do
                get :show, params: { id: user1.id }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(root_path)
            end
        end
        
    end
end
