# frozen_string_literal: true

class Cart < ApplicationRecord
  class CreateOrderOfficer
    attr_reader :params, :errors
    def initialize(params = {})
      @params = params
      @errors = []
    end

    def perform
      valid?
      return @errors unless errors.blank?

      save_order
      save_order_details
      update_cart
    end

    def update_cart
      cart = Cart.find params[:id]
      cart.status = :submitted
      cart.save!
    end

    def save_order
      order = Order.new
      order.number       = order.generate_number
      order.cart_id      = params[:id]
      order.store_id     = params[:store_id]
      order.user_id      = params[:user_id]
      order.address_id   = params[:address_id]
      order.tax          = params[:tax]
      order.discount     = params[:discount]
      order.shipping_fee = params[:shipping_fee]
      order.subtotal     = params[:subtotal]
      order.grand_total  = params[:grand_total]
      order.status       = :unpaid
      order.save!

      @order = order
    end

    def save_order_details
      params[:products].each_with_index do |product, idx|
        next if product[:status].inactive?

        order_detail = OrderDetail.new
        order_detail.number             = @order.number << "-#{idx+1}"
        order_detail.title              = product[:title]
        order_detail.product_variant_id = product[:variant_id]
        order_detail.quantity           = product[:quantity]
        order_detail.price              = product[:price]
        order_detail.discount           = product[:discount]
        order_detail.subtotal           = product[:subtotal]
        order_detail.save!
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
