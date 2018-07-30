class OrdersController < ApplicationController
    def index
        # To retrieve all the orders made by users so we can lay
        # them out to display
        @orders = Order.all
    end

    def show
    end
    # Will only receive data.
    def create
    end

    def destroy
    end
end