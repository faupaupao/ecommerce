class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string     :label
      t.string     :full_address
      t.string     :zip_code
      t.string     :name
      t.string     :phone
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
