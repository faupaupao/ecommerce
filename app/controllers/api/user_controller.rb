# frozen_string_literal: true

module Api
  class UsersController < ApiController
    before_action :prepare_user, only: %w[orders carts]

    def orders
      @orders = user.orders
    end

    def carts
      @carts = user.carts
    end

    private

    def prepare_user
      @user = User.find params[:user_id]
    end

  end
end
