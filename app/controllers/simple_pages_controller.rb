class SimplePagesController < ApplicationController
  def about
  end

  def contact
  end

  # Adding custom controller action.
  # The method will retrive the frist product in the products table
  # and set it to a variable called @featured_product
  # that we'll reference within the view - the page in no longer static.
  def landing_page
    @products = Product.limit(3)
  end

end
