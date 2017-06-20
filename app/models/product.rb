class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_attached_file :avatar, styles: { medium: '300x300', thumb: '100x100>' }, default_url: "missing_:style.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
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
