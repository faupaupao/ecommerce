class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true, index: true
      t.string     :number, index: true
      t.string     :title
      t.references :product_variant, foreign_key: true, index: true
      t.float      :quantity, default: 0
      t.decimal    :price, scale: 2, precision: 12
      t.decimal    :discount, scale: 2, precision: 12
      t.decimal    :subtotal, scale: 2, precision: 12
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
