class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :description
      t.references :user, foreign_key: true
      t.references :student, foreign_key: true
      t.references :note_type, foreign_key: true
      t.date :obtained_date
    end
  end
end
