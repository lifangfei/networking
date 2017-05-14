class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :username
      t.string   :password_digest
      t.string   :email, null: false
      t.string   :phone_number, null: false

      t.timestamps null: false
    end
  end
end
