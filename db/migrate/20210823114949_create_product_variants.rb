class CreateProductVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variants do |t|
      t.references :product, foreign_key: true
      t.string     :code
      t.string     :name
      t.decimal    :price, scale: 2, precision: 12
      t.integer    :quantity
      t.integer    :status
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
