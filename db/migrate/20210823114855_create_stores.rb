class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string   :name
      t.string   :phone
      t.string   :address
      t.string   :logo
      t.integer  :status

      t.datetime :deleted_at

      t.timestamps
    end
  end
end
