class TeacherGroupSubject < ApplicationRecord
  belongs_to :teacher
  belongs_to :group
  belongs_to :subject
end
