class ProductVariant < ApplicationRecord
  acts_as_paranoid

  belongs_to :product

  enum status: %w[inactive active]

  def self.active
    self.status = :active
  end

end
