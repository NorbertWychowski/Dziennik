class Group < ApplicationRecord
	has_many :students
	validates :year, numericality: true
	validates :groupID, presence: true
end
