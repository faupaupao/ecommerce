# frozen_string_literal: true

module Api
  class ProductsController < ApiController

    def index
      @products = Product.active
                         .search(params.permit!&.to_h)
    end

  end
end
