# frozen_string_literal: true

module ApiRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api, path: 'api', defaults: { format: :json } do

        resources :users, only: %i[index show] do
          collection do
            post 'carts', action: :carts
            post 'orders', action: :orders
          end
        end

        resources :carts, only: %i[index show] do
          collection do
            post 'create_order', action: :create_order
            post 'update_cart', action: :update_cart
          end
        end

        resources :products, only: %i[index show]

      end
    end
  end
end
