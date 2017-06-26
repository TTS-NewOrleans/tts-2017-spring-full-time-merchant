class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    if @line_item.save
      flash[:notice] = "#{product.name} was added to your cart!"
      redirect_to shop_path
    else
      flash.now[:alert] = "Couldn't add the item to your cart."
      redirect_to :back
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])

    if @line_item.destroy
      flash[:notice] = 'Gone!'
      redirect_to edit_cart_path
    else
      flash.now[:alert] = 'There was a problem, try again.'
      redirect_to edit_cart_path
    end
  end
end
