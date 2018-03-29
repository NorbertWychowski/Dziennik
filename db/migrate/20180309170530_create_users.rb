class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :phone
      t.string :email
      t.string :login
      t.string :password_digest
      t.string :address
      t.date :birth_date
      t.references :user_type, foreign_key: true
    end
  end
end
