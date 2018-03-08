class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.string :grade
      t.integer :weight
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true
    end
  end
end
