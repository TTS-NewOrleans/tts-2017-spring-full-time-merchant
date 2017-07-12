class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user

  validates :name, :address, :user_id, presence: true

  PAYMENT_TYPES = ["Cash", "Check", "PayPal", "COD", "Wampum", "BitCoin", "Barter"]
  validates :pay_type, presence: true, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def subtotal
    # SQL way (much faster)
    line_items.select("SUM(quantity * price) AS sum")[0].sum
    # Ruby way
    # line_items.to_a.sum { |item| item.total }
  end
end

# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :text
#  pay_type   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
