-- INSERTs

INSERT INTO Members (first_name, last_name, email, psswrd, points) VALUES 
    ('John', 'Doe', 'johndoe@example.com', 'passwd1', 100),
    ('Jane', 'Doe', 'janedoe@example.com', 'passwd2', 200),
    ('John', 'Smith', 'johnsmith@example.com', 'passwd3', 300);
	
INSERT INTO Fitness_Goals (mid, goal_name, goal_progress, goal_target) VALUES 
    (1, 'Deadlift 500lbs', 300, 500),
    (2, 'Swim 100m', 50, 100),
    (3, 'Run 5km', 2, 5);

INSERT INTO Health_Metrics (mid, metric_value, metric_type) VALUES 
    (1, 200, 'Weight'),
    (2, 20, 'Body Fat'),
    (3, 75, 'Muscle Mass');

INSERT INTO Events (event_name, date_time, duration, event_type) VALUES 
    ('Yoga', '2023-07-01:', 60, 'Yoga'),
    ('Weightlifting', '2023-07-09', 120, 'Weightlifting');

INSERT INTO Participates (mid, eid) VALUES 
    (1, 1),
    (2, 1),
    (3, 2);

INSERT INTO Trainers (first_name, last_name, email, psswrd) VALUES
    ('Sam', 'Sulek', 'samsulek@hfcms.com', 'passwd2'),
    ('Chris', 'Bumstead', 'cbum@hfcms.com', 'passwd1');

INSERT INTO PT_Trains (mid, tid, date_time, duration, note) VALUES 
    (1, 1, '2023-07-01', 60, 'John is doing great!'),
    (2, 1, '2023-07-09', 120, 'Jane is doing great!'),
    (3, 2, '2023-07-09', 120, 'John is doing great!');

INSERT INTO Staffs (first_name, last_name, email, psswrd) VALUES 
    ('John', 'Wick', 'johnwick@hfcms.com', 'passwd1'),
    ('James', 'Bond', 'jamesbond@hfcms.com', 'passwd2');

INSERT INTO Billings (payer, date_time, amount, pay_for) VALUES 
    ('johndoe@example.com', '2023-07-01', 10, '10 PT Sessions John Wick'),
    ('janedoe@example.com', NULL, 300, 'Membership Fee'),
    ('johnsmith@example.com', '2023-07-09', 300, 'Membership Fee');

INSERT INTO Manages (staff_id, billing_id) VALUES
    (1, 1),
    (2, 2),
    (2, 3);

-- *********************************************************************************************************

-- SELECT name and email of all trainers
SELECT first_name, last_name, email FROM Trainers;

-- SELECT all members who have not paid their bills
SELECT first_name, last_name FROM Members 
WHERE email IN (SELECT payer FROM Billings WHERE date_time IS NULL);

-- SELECT all bills that have not been paid
SELECT * FROM Billings WHERE date_time IS NULL;

-- SELECT all members whose personal trainer is Sam Sulek
SELECT first_name, last_name FROM Members 
WHERE mid IN (SELECT mid FROM PT_Trains 
              WHERE tid = (SELECT tid FROM Trainers WHERE first_name = 'Sam' AND last_name = 'Sulek'));

-- UPDATE John Doe's fitness goal progress to 400
UPDATE Fitness_Goals
SET goal_progress = 400
WHERE mid = (SELECT mid FROM Members WHERE first_name = 'John' AND last_name = 'Doe');

-- UPDATE Jane Doe's PT session's note to be "She's killing it!"
UPDATE PT_Trains
SET note = 'She''s killing it!'
WHERE mid = (SELECT mid FROM Members WHERE first_name = 'Jane' AND last_name = 'Doe');
