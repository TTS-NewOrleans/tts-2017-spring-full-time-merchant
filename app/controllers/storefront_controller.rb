class StorefrontController < ApplicationController
  def index
    if params[:cat_id]
      # I only want to see the stuff in that category
      @category = Category.find(params[:cat_id])
      @products = Product.where(category_id: params[:cat_id])
    else
      @products = Product.all
    end
  end

  def about
  end
end
