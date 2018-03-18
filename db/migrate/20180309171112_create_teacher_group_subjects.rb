class CreateTeacherGroupSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_group_subjects do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.references :subject, foreign_key: true
    end
  end
end
