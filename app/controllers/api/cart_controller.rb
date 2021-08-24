# frozen_string_literal: true

module Api
  class CartController < ApiController
    def create_order
      officer = Cart::CreateOrderOfficer.new(params.permit!&.to_h)
      officer.perform
      return error_400(officer.errors) unless officer.errors.size.zero?
    end

    def update_cart
      officer = Cart::UpdateOfficer.new(params.permit!&.to_h)
      officer.perform
      return error_400(officer.errors) unless officer.errors.size.zero?
    end
  end
end
