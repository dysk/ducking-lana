class StoreController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], order: 'title asc', per_page: 4)
    @cart = current_cart
  end
end
