class PaymentsController < ApplicationController
    before_action :authenticate_user!
    def create
        @product = Product.find(params[:product_id])
        @user = current_user
        token = params[:stripeToken]
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          charge = Stripe::Charge.create(
            amount: (@product.price * 100).to_i, 
            currency: "usd",
            source: token,
            description: params[:stripeEmail]
          )

          if charge.paid
            Order.create(
                product_id: @product.id, 
                user_id: @user.id, 
                total: @product.price, 
                created_at: Time.now
                )

            UserMailer.successful_payment(@user, @product).deliver_now
          end 

        rescue Stripe::CardError => e
          # The card has been declined
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end 
        redirect_to product_path(@product), notice: 'Thank you for your purchase'
    end
end
