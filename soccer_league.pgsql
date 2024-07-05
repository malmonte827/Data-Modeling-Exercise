DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;



CREATE TABLE teams 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season 
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team_1_id INTEGER REFERENCES teams NOT NULL,
    team_2_id INTEGER REFERENCES teams NOT NULL,
    season_id INTEGER REFERENCES season NOT NULL,
    referee_id INTEGER REFERENCES referees
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches NOT NULL,
    team_id INTEGER REFERENCES teams NOT NULL,
    results TEXT NOT NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players NOT NULL,
    match_id INTEGER REFERENCES matches NOT NULl, 
    goals INTEGER CHECK (goals >= 0)
);



INSERT INTO teams (name)
VALUES
('Falcons'),
('Eagles'),
('Spartans');

INSERT INTO season (start_date, end_date)
VALUES
('2016-01-01', '2016-06-22'),
('2015-11-10', '2016-05-10'),
('2015-12-12', '2016-06-22');

INSERT INTO referees (name)
VALUES
('Might Guy'),
('Rock Lee'),
('Neji');

INSERT INTO players (name, team_id)
VALUES 
('Miranda Bailey', 1),
('Richard Webber', 2),
('Jo Wilson', 3);

INSERT INTO matches (team_1_id, team_2_id, season_id, referee_id)
VALUES
(1,2,1,1),
(2,3,2,2),
(1,3,3,3);

INSERT INTO results (match_id, team_id, results)
VALUES
(1,1, 'WIN'),
(2,3, 'WIN'),
(3,3, 'WIN');

INSERT INTO goals (player_id, match_id, goals)
VALUES
(1,1,3),
(2,2,0),
(3,3,6);
