class Teacher < ApplicationRecord
  has_many :teacher_group_subjects
  has_many :grades
end
