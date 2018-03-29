class CreateNoteTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :note_types do |t|
      t.string :note_type
    end
  end
end
