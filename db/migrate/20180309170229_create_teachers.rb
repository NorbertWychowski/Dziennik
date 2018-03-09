class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :firstName
      t.string :lastName
      t.string :phone
      t.string :email
      t.boolean :isAdmin
      t.string :login
      t.string :password
    end
  end
end
