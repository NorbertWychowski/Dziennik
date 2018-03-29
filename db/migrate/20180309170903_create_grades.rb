class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.string :grade
      t.string :info
      t.date :obtained_date
      t.references :subject, foreign_key: true
      t.references :student, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
