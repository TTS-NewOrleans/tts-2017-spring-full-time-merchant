class OrdersController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  before_action :set_cart, only: [:new, :create]

  def new
    if @cart.line_items.empty?
      redirect_to shop_url, notice: "Your cart is empty."
      return
    end

    @order = Order.new
    @order.user_id = current_user.id
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.add_line_items_from_cart(@cart)

    if @order.save
      # Destroy the cart
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      # Redirect them to the store
      redirect_to shop_url, notice: 'Thanks for your order!'
    else
      render :new
    end
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :pay_type, :user_id)
  end
end
