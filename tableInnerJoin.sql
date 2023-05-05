use practiceDB

create table student 
(
	studentID int identity(1,1) primary key,
	studentFirstName varchar(255),
	studentLastName varchar(255),
	studentAge int,
	studentAddress varchar(255)
)

create table course 
(
	courseID int identity(1,1) primary key,
	courseName varchar(255),
	courseDescription varchar(255),
	courseDuration int
)

insert into student(studentFirstName, studentLastName, studentAge, studentAddress) values('abc', 'asd',25,'delhi'), ('qwer', 'wer',24,'Mumbai'),
('asdf', 'asd',23,'chennai'), ('poiuyt', 'vfe',27,'kolkata'), ('zxcvb', 'plm',28,'hydrabad'), ('asdfghj', 'wer',22,'kanpur')

insert into course(courseName, courseDescription, courseDuration) values('C', 'basics',4), ('C++', 'OOPs',6),
('Java', 'Spring Hybernet',8), ('C#', '.Net visual studio',8), ('Python', 'Django',10), ('Database', 'SQL DML DDL',3)

create table Enrollment 
(
	Enrollment int primary key identity(1,1),
	courseID int foreign key references course(courseID),
	studentID int foreign key references student(studentID)	
)

insert into Enrollment (courseID, studentID) values (5,1),(5,3),(6,2),(6,1),(4,5),(3,6),(2,4),(1,6)

select * from student
select * from course

select student.studentFirstName, course.courseName
from Enrollment
inner join course on Enrollment.courseID = course.courseID 
inner join student on Enrollment.studentID = student.studentID
