-- Primary keys changed from provided query to auto-increment

CREATE TABLE Members (
    id INT PRIMARY KEY auto_increment,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY auto_increment,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- Task 1: SQL Data Insertion
INSERT INTO Members (name, age)
VALUES ('Alice Smith', 32),
       ('Bob White', 23),
       ('Carol Jackson', 48),
       ('Daryl Ortiz', 34),
       ('Edward Black', 45),
       ('Jane Doe', 23),
       ('John Smith', 47);

insert into workoutsessions (member_id, session_date, session_time, activity)
values (1, '2024-09-01', '9 AM', 'Yoga'),
	   (4, '2024-09-01', '9 AM', 'Yoga'),
       (2, '2024-09-03', '2 PM', 'Benchpress'),
       (3, '2024-09-05', '10 AM', 'Basketball'),
       (2, '2024-09-08', '11 AM', 'Cycling'),
       (6, '2024-09-04', '8 AM', 'Treadmill');
       
-- Task 2: SQL Data Update
update workoutsessions ws
join members m on m.id = ws.member_id
set session_time = '6 PM'
where m.name like 'Jane Doe';

-- Task 3: SQL Data Deletion
set sql_safe_updates = 0;
delete from members
where name like 'John Smith';
set sql_safe_updates = 1;