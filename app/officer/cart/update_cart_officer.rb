# frozen_string_literal: true

class Cart < ApplicationRecord
  class UpdateCartOfficer
    attr_reader :params, :errors
    def initialize(params = {})
      @params = params
      @errors = []
    end

    def perform
      valid?
      return @errors unless errors.blank?

      update_cart
      update_cart_details
    end

    def update_cart
      cart = Cart.find_or_initialize_by(id: params[:id])
      cart.store_id     = params[:store_id]
      cart.user_id      = params[:user_id]
      cart.address_id   = params[:address_id]
      cart.tax          = params[:tax]
      cart.discount     = params[:discount]
      cart.shipping_fee = params[:shipping_fee]
      cart.subtotal     = params[:subtotal]
      cart.grand_total  = params[:grand_total]
      cart.status       = :draft
      cart.save!

      @cart = cart
    end

    def update_cart_details
      params[:products].each_with_index do |product, idx|
        next if product[:status].inactive?

        cart_detail = OrderDetail.find_or_initialize_by(id: product[:id])
        cart_detail.title              = product[:title]
        cart_detail.product_variant_id = product[:variant_id]
        cart_detail.quantity           = product[:quantity]
        cart_detail.price              = product[:price]
        cart_detail.discount           = product[:discount]
        cart_detail.subtotal           = product[:subtotal]
        cart_detail.status             = product[:status]
        cart_detail.save!
      end
    end

    private

    def valid?
      valid_product?
    end

    def valid_product?
      @errors << 'Product invalid' if params[:products].blank?
    end
  end
end
