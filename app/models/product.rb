class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :line_items
  before_destroy :did_anyone_buy_this_thing?


  validates :name, :brand, :category, presence: true
  validates_uniqueness_of :name, scope: :brand_id

  validates_numericality_of :price, greater_than_or_equal_to: 0.01

  validates_numericality_of :quantity, greater_than_or_equal_to: 0

  has_attached_file :avatar, styles: { medium: '300x300', thumb: '100x100>' }, default_url: "missing_:style.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.search_by_name_or_description(search_term)
    where("name LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
  end

  private

  # Make sure no one bought this product before we toss it.
  # If you toss a product that someone bought, their order history will have problems.

  def did_anyone_buy_this_thing?
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items Present')
      return false
    end
  end
end

# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  price               :decimal(, )
#  quantity            :integer
#  description         :text
#  brand_id            :integer
#  category_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_products_on_brand_id     (brand_id)
#  index_products_on_category_id  (category_id)
#
