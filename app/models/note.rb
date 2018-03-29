class Note < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :note_type
end
