class Order < ApplicationRecord
    # This sets up the relationship between orders and products 
    # Rails expects to find a column in the orders db table
    # called product_id that refernces the ID of the product in the order.
    # Each order can be assigned to one product.
    belongs_to :product
end

