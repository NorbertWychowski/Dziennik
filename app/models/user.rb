class User < ApplicationRecord
  has_secure_password
  belongs_to :user_type
  has_many :students
  has_many :teacher_group_subjects
  has_many :grades
  accepts_nested_attributes_for :students
end
