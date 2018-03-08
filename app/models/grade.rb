class Grade < ApplicationRecord
	@gradesT = ["1", "-2", "2", "+2", "-3", "3", "+3", "-4", "4", "+4", "-5", "5", "+5", "6"]
	belongs_to :student
	belongs_to :subject
	validates :grade, :inclusion => { :in => @gradesT }
end