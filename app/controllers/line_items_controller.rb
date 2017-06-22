class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product, price: product.price, quantity: 1)

    if @line_item.save
      flash[:notice] = "#{product.name} was added to your cart!"
      redirect_to shop_path
    else
      flash.now[:alert] = "Couldn't add the item to your cart."
      redirect_to :back
    end

  end
end
