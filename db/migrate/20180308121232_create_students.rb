class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.references :group, foreign_key: true
    end
  end
end
