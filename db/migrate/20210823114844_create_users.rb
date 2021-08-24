class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :phone
      t.string   :birthday
      t.integer  :gender

      t.string   :email,              null: false, default: ""
      t.string   :encrypted_password, null: false, default: ""

      t.datetime :deleted_at

      t.timestamps
    end
  end
end
