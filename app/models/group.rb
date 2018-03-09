class Group < ApplicationRecord
  has_many :students
  has_many :teacher_group_subjects
end
