
create table if not exists Person
(
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  firstname varchar(50) NOT NULL, 
  lastname varchar(100) NOT NULL, 
  email varchar(45) NOT NULL UNIQUE, 
  address varchar(45) NOT NULL, 
  city varchar(45) NOT NULL, 
  password varchar(100), 
  dtype varchar(31)
);
create UNIQUE INDEX SQL_PERSON_EMAIL_INDEX ON Person (email);
create UNIQUE INDEX SQL_PERSON_ID_INDEX ON Person (id);

create table if not exists Groups
(
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  name varchar(50) NOT NULL, 
  description varchar(300)
);
create table if not exists Person_Groups
(
  groups_id int NOT NULL, 
  email varchar(45) NOT NULL
);

ALTER TABLE Person_Groups
ADD CONSTRAINT FK_PERSON_GROUPS_PERSON
FOREIGN KEY (email)
REFERENCES Person(email)
;
ALTER TABLE Person_Groups
ADD CONSTRAINT FK_PERSON_GROUPS_GROUPS
FOREIGN KEY (groups_id)
REFERENCES Groups(id)
;

CREATE VIEW Person_Groups_view AS 
SELECT p.email AS email, p.password AS password, g.name AS group_name 
FROM ((Person_Groups pg 
JOIN Person p ON ((p.email = pg.email))) 
JOIN Groups g ON ((g.id = pg.groups_id)))
;
