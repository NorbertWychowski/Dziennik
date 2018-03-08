class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :subjectName
      t.integer :finalGrade
    end
  end
end
