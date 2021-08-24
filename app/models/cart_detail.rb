class CartDetail < ApplicationRecord
  acts_as_paranoid

  has_one   :product_variant
  has_one   :product, through: :product_variant

  enum status: %w[inactive active]
end
