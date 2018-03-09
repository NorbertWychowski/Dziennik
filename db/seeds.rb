# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies[0])
#

groups = Group.create([{groupName: '2-C'}, {groupName: '3-D'}])
students = Student.create([{firstName: 'Jan', lastName: 'Nowak', phone: '555-444-333', email: '123@gmail.com', login: 'student01', password: 'student', group: groups[0]},
                          {firstName: 'Tomasz', lastName: 'Nowak', phone: '555-444-333', email: '1234@gmail.com', login: 'student02', password: 'student', group: groups[0]},
                          {firstName: 'Adam', lastName: 'Kowalski', phone: '555-444-333', email: '234@gmail.com', login: 'student03', password: 'student', group: groups[0]},
                          {firstName: 'Michał', lastName: 'Nowak', phone: '555-444-333', email: '2345@gmail.com', login: 'student04', password: 'student', group: groups[0]},
                          {firstName: 'Arkadiusz', lastName: 'Nowak', phone: '555-444-333', email: '345@gmail.com', login: 'student05', password: 'student', group: groups[0]},
                          {firstName: 'Stefan', lastName: 'Kowalski', phone: '555-444-333', email: '3456@gmail.com', login: 'student06', password: 'student', group: groups[0]},
                          {firstName: 'Jan', lastName: 'Kowalski', phone: '555-444-333', email: '456@gmail.com', login: 'student07', password: 'student', group: groups[1]},
                          {firstName: 'Stefan', lastName: 'Nowak', phone: '555-444-333', email: '4567@gmail.com', login: 'student08', password: 'student', group: groups[1]},
                          {firstName: 'Adam', lastName: 'Nowak', phone: '555-444-333', email: '567@gmail.com', login: 'student09', password: 'student', group: groups[1]},
                          {firstName: 'Tadeusz', lastName: 'Kowalski', phone: '555-444-333', email: '5678@gmail.com', login: 'student10', password: 'student', group: groups[1]},
                          {firstName: 'Mateusz', lastName: 'Nowak', phone: '555-444-333', email: '4321@gmail.com', login: 'student11', password: 'student', group: groups[1]}])
subjects = Subject.create([{subjectName: 'Matematyka'},
                           {subjectName: 'Język Polski'},
                           {subjectName: 'Język Angielski'},
                           {subjectName: 'Fizyka'},
                           {subjectName: 'Chemia'},])
teachers = Teacher.create([{firstName: 'Anna', lastName: 'Nowak', phone: '555-444-333', email: 'n123@gmail.com', isAdmin: true, login: 'nauczyciel01', password: 'nauczyciel'},
                           {firstName: 'Anna', lastName: 'Kowalska', phone: '555-444-333', email: 'n124@gmail.com', isAdmin: false, login: 'nauczyciel02', password: 'nauczyciel'},
                           {firstName: 'Katarzyna', lastName: 'Nowak', phone: '555-444-333', email: 'n125@gmail.com', isAdmin: false, login: 'nauczyciel02', password: 'nauczyciel'}])
teacher_group_subjects = TeacherGroupSubject.create([{teacher: teachers[0], group: groups[0], subject: subjects[0]},
                                                     {teacher: teachers[0], group: groups[1], subject: subjects[0]},
                                                     {teacher: teachers[0], group: groups[0], subject: subjects[3]},
                                                     {teacher: teachers[0], group: groups[1], subject: subjects[3]},
                                                     {teacher: teachers[0], group: groups[0], subject: subjects[4]},
                                                     {teacher: teachers[0], group: groups[1], subject: subjects[4]},
                                                     {teacher: teachers[1], group: groups[0], subject: subjects[1]},
                                                     {teacher: teachers[1], group: groups[1], subject: subjects[1]},
                                                     {teacher: teachers[2], group: groups[0], subject: subjects[2]},
                                                     {teacher: teachers[2], group: groups[1], subject: subjects[2]}])
grades = Grade.create([{grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[0], teacher: teachers[0]},
                       {grade: '4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[0], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[0], teacher: teachers[0]},
                       {grade: '4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[1], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[1], teacher: teachers[0]},
                       {grade: '3', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[1], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[2], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[2], teacher: teachers[0]},
                       {grade: '2', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[2], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[3], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[3], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[3], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[1], student: students[0], teacher: teachers[1]},
                       {grade: '4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[1], student: students[0], teacher: teachers[1]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[1], student: students[0], teacher: teachers[1]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[2], student: students[0], teacher: teachers[2]},
                       {grade: '6', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[2], student: students[0], teacher: teachers[2]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[2], student: students[0], teacher: teachers[2]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[3], student: students[0], teacher: teachers[0]},
                       {grade: '4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[3], student: students[0], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[3], student: students[0], teacher: teachers[0]},
                       {grade: '3', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[4], student: students[0], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[4], student: students[0], teacher: teachers[0]},
                       {grade: '4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[4], student: students[0], teacher: teachers[0]},
                       {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[4], student: students[0], teacher: teachers[0]}])