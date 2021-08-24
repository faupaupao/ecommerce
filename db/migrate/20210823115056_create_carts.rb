class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references  :user, foreign_key: true, index: true
      t.references  :store, foreign_key: true, index: true
      t.references  :address, foreign_key: true, index: true
      t.decimal     :tax, scale: 2, precision: 12
      t.decimal     :discount, scale: 2, precision: 12
      t.decimal     :shipping_fee, scale: 2, precision: 12
      t.decimal     :subtotal, scale: 2, precision: 12
      t.decimal     :grand_total, scale: 2, precision: 12
      t.integer     :status
      t.datetime    :deleted_at

      t.timestamps
    end
  end
end
