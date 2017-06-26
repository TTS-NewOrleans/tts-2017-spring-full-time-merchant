class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def subtotal
    # SQL way (much faster)
    line_items.select("SUM(quantity * price) AS sum")[0].sum
    # Ruby way
    # line_items.to_a.sum { |item| item.total }
  end

  def add_product(product_id)
    product = Product.find(product_id)
    current_item = line_items.find_by(product_id: product_id)

    if current_item
      # increase the quantity by 1
      current_item.quantity += 1
    else
      # make a new line item
      current_item = line_items.build(product: product, price: product.price)
    end

    current_item
  end
end

# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
