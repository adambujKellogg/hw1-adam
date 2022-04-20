
-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS cast_member;

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  rating TEXT,
  studio_id INTEGER
);
CREATE TABLE studio (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  studio_name TEXT
);

CREATE TABLE cast_member (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor TEXT,
  character TEXT,
  movie_id INTEGER
);


-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!
INSERT INTO studio (studio_name)
VALUES ('Warner Bros.');

INSERT INTO movies (title, year, rating, studio_id)
VALUES ('Batman Begins', 2005,'PG-13',1),
 ('The Dark Knight', 2008,'PG-13',1),
 ('The Dark Knight Rises', 2012,'PG-13', 1);

INSERT INTO cast_member (actor, character, movie_id)
VALUES ('Christian Bale', 'Bruce Wayne',1),
 ('Michael Caine', 'Alfred',1),
 ('Liam Neeson', 'Ras Al Ghul',1),
 ('Katie Holmes', 'Rachel Dawes',1),
 ('Gary Oldman', 'Commissioner Gordon',1),
 ('Christian Bale', 'Bruce Wayne',2),
 ('Michael Caine', 'Alfred',2),
 ('Heath Ledger', 'Joker',2),
 ('Aaron Eckhart', 'Harvey Dent',2),
 ('Maggie Gyllenhaal', 'Rachel Dawes',2),
 ('Christian Bale', 'Bruce Wayne',3),
 ('Tom Hardy', 'Bane',3),
 ('Joseph Gordon-Levitt', 'John Blake',3),
 ('Anne Hathaway', 'Selina Kyle',3),
 ('Gary Oldman', 'Commissioner Gordon',3);
-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!
SELECT movies.title, movies.year, movies.rating, studio.studio_name FROM studio INNER JOIN movies ON studio.id = movies.studio_id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!
SELECT movies.title, cast_member.actor, cast_member.character FROM cast_member INNER JOIN movies ON cast_member.movie_id = movies.id;
-- Batman Begins          Christian Bale        Bruce Wayn