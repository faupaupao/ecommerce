class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :store, foreign_key: true
      t.string     :code
      t.string     :name
      t.integer    :status
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
