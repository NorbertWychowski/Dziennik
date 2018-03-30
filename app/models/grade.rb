class Grade < ApplicationRecord
  @grades = {"1" => 1.0, "-2" => 1.75, "2" => 2.0, "+2" => 2.5, "-3" => 2.75, "3" => 3, "+3" => 3.5,
             "-4" => 3.75, "4" => 4, "+4" => 4.5, "-5" => 4.75, "5" => 5, "+5" => 5.5, "6" => 6}
  @grade_info = %w(Kartkówka Sprawdzian)

  def self.grade_values(grade)
    @grades[grade]
  end

  def self.get_grades
    @grades
  end

  def self.get_grade_info
    @grade_info
  end

  validates :grade, inclusion: {in: @grades.keys}
  validates :info, inclusion: {in: @grade_info}

  belongs_to :subject
  belongs_to :student
  belongs_to :user
end
