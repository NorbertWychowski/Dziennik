class Student < ApplicationRecord
  has_many :grades
  belongs_to :group
end
