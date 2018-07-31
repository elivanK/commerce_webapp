class OrdersController < ApplicationController
    def index
        # To retrieve all the orders made by users so we can lay
        # them out to display
        @orders = Order.incluedes(:product).all
    end

    def show
        @order = Order.find(params[:id])
    end
    # Will only receive data.
    def create
    end

    def destroy
    end
end