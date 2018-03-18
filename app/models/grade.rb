class Grade < ApplicationRecord
  belongs_to :subject
  belongs_to :student
  belongs_to :user
end
