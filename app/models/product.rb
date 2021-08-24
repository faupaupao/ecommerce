class Product < ApplicationRecord
  acts_as_paranoid

  belongs_to :store
  has_many   :product_variants

  enum status: %w[inactive active]

  scope :by_query, lambda { |query|
    return where(nil) if query.blank?

    eager_load(:product_variants)
      .eager_load(:store)
        .where('products.name ILIKE :query OR products.code ILIKE :query OR stores.name ILIKE :query', query: "%#{query}%")
  }

  def self.active
    self.status = :active
  end

  def self.search(params)
    params = {} if params.blank?

    by_query(params[:query])
  end

end
