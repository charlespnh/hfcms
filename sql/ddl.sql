CREATE TABLE Members
	(mid 		    SERIAL,
	 first_name 	TEXT 	    NOT NULL,
     last_name 	    TEXT 	    NOT NULL,
	 email 			TEXT 	    UNIQUE NOT NULL,
	 psswrd 		TEXT 	    NOT NULL,
	 points 		INTEGER,
	 PRIMARY KEY (mid)
	);

CREATE TABLE Fitness_Goals
	(mid 	        INTEGER,
	 goal_progress 	INTEGER,
	 goal_target	INTEGER,
	 goal_name 	    TEXT        UNIQUE NOT NULL,
	 FOREIGN KEY (mid) REFERENCES Members
	);
	
CREATE TABLE Health_Metrics
	(mid		    INTEGER,
	 metric_value	INTEGER,
	 metric_type 	TEXT,
	 FOREIGN KEY (mid) REFERENCES Members
	);
	
CREATE TABLE Events
	(eid			SERIAL,
	 event_name		TEXT		NOT NULL,
	 date_time		DATE		NOT NULL,
	 duration       INTEGER,
     event_type     TEXT,
     PRIMARY KEY (eid)
	);

CREATE TABLE Participates
	(mid	INTEGER,
	 eid	INTEGER,
	 FOREIGN KEY (mid) REFERENCES Members,
	 FOREIGN KEY (eid) REFERENCES Events
	);

CREATE TABLE Trainers
	(tid 	    SERIAL,
	 first_name	TEXT	NOT NULL,
     last_name	TEXT	NOT NULL,
	 email		TEXT 	UNIQUE NOT NULL,
	 psswrd		TEXT	NOT NULL,
	 PRIMARY KEY (tid)
	);

CREATE TABLE PT_Trains
	(mid			INTEGER,
	 tid 		    INTEGER,
	 date_time		DATE	NOT NULL,
	 duration 		TEXT	NOT NULL,
	 note			TEXT,
	 FOREIGN KEY (mid) REFERENCES Members,
	 FOREIGN KEY (tid) REFERENCES Trainers
	);

CREATE TABLE Staffs
	(id				SERIAL,
	 first_name		TEXT 	NOT NULL,
     last_name		TEXT 	NOT NULL,
	 email			TEXT 	UNIQUE NOT NULL,
	 psswrd			TEXT 	NOT NULL,
	 PRIMARY KEY (id)
	);

CREATE TABLE Billings
	(bid		SERIAL,
	 payer		TEXT 		    NOT NULL,
	 date_time	DATE,
	 amount		DECIMAL(20,2)	NOT NULL,
	 pay_for	TEXT 			NOT NULL,
	 PRIMARY KEY (bid)
	);

CREATE TABLE Manages
    (staff_id	        INTEGER,
     billing_id		    INTEGER,
     FOREIGN KEY (staff_id) REFERENCES Staffs,
     FOREIGN KEY (billing_id) REFERENCES Billings
    );
	
