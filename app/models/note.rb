class Note < ApplicationRecord
  validate :note_type_exists

  def note_type_exists
    return false if NoteType.find_by_id(self.note_type).nil?
  end

  belongs_to :user
  belongs_to :student
  belongs_to :note_type
end
