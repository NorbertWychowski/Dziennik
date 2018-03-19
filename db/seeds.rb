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
user_type = UserType.create([{userType: 'Admin'}, {userType: 'Nauczyciel'}, {userType: 'Uczeń'}])
users = User.create([{firstName: 'Adam', lastName: 'Adminowy', phone: '123-444-567', email: 'admin125@gmail.com', login: 'admin', password_digest: BCrypt::Password.create('admin'), user_type: user_type[0]},
                     {firstName: 'Anna', lastName: 'Nowak', phone: '555-444-333', email: 'n123@gmail.com', login: 'nauczyciel01', password_digest: BCrypt::Password.create('nauczyciel'), user_type: user_type[1]},
                     {firstName: 'Anna', lastName: 'Kowalska', phone: '555-444-333', email: 'n124@gmail.com', login: 'nauczyciel02', password_digest: BCrypt::Password.create('nauczyciel'), user_type: user_type[1]},
                     {firstName: 'Katarzyna', lastName: 'Nowak', phone: '555-444-333', email: 'n125@gmail.com', login: 'nauczyciel03', password_digest: BCrypt::Password.create('nauczyciel'), user_type: user_type[1]},
                     {firstName: 'Jan', lastName: 'Nowak', phone: '555-444-333', email: '123@gmail.com', login: 'student01', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Tomasz', lastName: 'Nowak', phone: '555-444-333', email: '1234@gmail.com', login: 'student02', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Adam', lastName: 'Kowalski', phone: '555-444-333', email: '234@gmail.com', login: 'student03', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Michał', lastName: 'Nowak', phone: '555-444-333', email: '2345@gmail.com', login: 'student04', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Arkadiusz', lastName: 'Nowak', phone: '555-444-333', email: '345@gmail.com', login: 'student05', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Stefan', lastName: 'Kowalski', phone: '555-444-333', email: '3456@gmail.com', login: 'student06', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Jan', lastName: 'Kowalski', phone: '555-444-333', email: '456@gmail.com', login: 'student07', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Stefan', lastName: 'Nowak', phone: '555-444-333', email: '4567@gmail.com', login: 'student08', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Adam', lastName: 'Nowak', phone: '555-444-333', email: '567@gmail.com', login: 'student09', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Tadeusz', lastName: 'Kowalski', phone: '555-444-333', email: '5678@gmail.com', login: 'student10', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]},
                     {firstName: 'Mateusz', lastName: 'Nowak', phone: '555-444-333', email: '4321@gmail.com', login: 'student11', password_digest: BCrypt::Password.create('student'), user_type: user_type[2]}])
subjects = Subject.create([{subjectName: 'Matematyka'},
                           {subjectName: 'Język Polski'},
                           {subjectName: 'Język Angielski'},
                           {subjectName: 'Fizyka'},
                           {subjectName: 'Chemia'},])
TeacherGroupSubject.create([{user: users[1], group: groups[0], subject: subjects[0]},
                            {user: users[1], group: groups[1], subject: subjects[0]},
                            {user: users[1], group: groups[0], subject: subjects[3]},
                            {user: users[1], group: groups[1], subject: subjects[3]},
                            {user: users[1], group: groups[0], subject: subjects[4]},
                            {user: users[1], group: groups[1], subject: subjects[4]},
                            {user: users[2], group: groups[0], subject: subjects[1]},
                            {user: users[2], group: groups[1], subject: subjects[1]},
                            {user: users[3], group: groups[0], subject: subjects[2]},
                            {user: users[3], group: groups[1], subject: subjects[2]}])
students = Student.create([{user: users[4], group: groups[0]},
                           {user: users[5], group: groups[0]},
                           {user: users[6], group: groups[0]},
                           {user: users[7], group: groups[0]},
                           {user: users[8], group: groups[0]},
                           {user: users[9], group: groups[0]},
                           {user: users[10], group: groups[1]},
                           {user: users[11], group: groups[1]},
                           {user: users[12], group: groups[1]},
                           {user: users[13], group: groups[1]},
                           {user: users[14], group: groups[1]}])
Grade.create([{grade: '-5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[0], user: users[1]},
              {grade: '4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[0], user: users[1]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[0], user: users[1]},
              {grade: '+4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[1], user: users[1]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[1], user: users[1]},
              {grade: '+3', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[1], user: users[1]},
              {grade: '-5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[2], user: users[1]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[2], user: users[1]},
              {grade: '+2', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[2], user: users[1]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[3], user: users[1]},
              {grade: '-5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[3], user: users[1]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[0], student: students[3], user: users[1]},
              {grade: '+5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[1], student: students[0], user: users[2]},
              {grade: '4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[1], student: students[0], user: users[2]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[1], student: students[0], user: users[2]},
              {grade: '+5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[2], student: students[0], user: users[3]},
              {grade: '6', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[2], student: students[0], user: users[3]},
              {grade: '-5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[2], student: students[0], user: users[3]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[3], student: students[0], user: users[1]},
              {grade: '-4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[3], student: students[0], user: users[1]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[3], student: students[0], user: users[1]},
              {grade: '+3', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[4], student: students[0], user: users[1]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[4], student: students[0], user: users[1]},
              {grade: '+4', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[4], student: students[0], user: users[1]},
              {grade: '5', info: 'Sprawdzian', obtainedDate: '2015-01-01', subject: subjects[4], student: students[0], user: users[1]}])