DROP DATABASE IF EXISTS file_directory_dev;
CREATE DATABASE file_directory_dev;

\c file_directory_dev

CREATE TABLE computers (
  id serial PRIMARY KEY,
  name varchar NOT NULL
);

CREATE TABLE users (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  computer_id integer REFERENCES computers (id)
);

CREATE TABLE directories (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  user_id integer REFERENCES users (id)
);

CREATE TABLE files (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  extension varchar(12) DEFAULT '.txt',
  directory_id integer REFERENCES directories (id)
);

INSERT INTO computers (name) VALUES
  ('MacBook Pro'),
  ('Dell');

INSERT INTO users (name, computer_id) VALUES
  ('Lonnie', 1),
  ('Isabel', 2),
  ('Sherry', 2);

INSERT INTO directories (name, user_id) VALUES
  ('Documents', 1),
  ('Documents', 2),
  ('Desktop', 1),
  ('Desktop', 2),
  ('Home', 3);

INSERT INTO files (name, extension, directory_id) VALUES
  ('Task List', 'txt', 1),
  ('avatar', 'jpg', 2),
  ('Intro to Philosophy Paper FINAL (2)', 'docx', 3),
  ('2017 Budget', 'xls', 4),
  ('kitty', 'gif', 5),
  ('n0t4v1ru5', 'exe', 4),
  ('notes', 'txt', 3),
  ('blues', 'mp4', 2),
  ('2015-taxes', 'pdf', 3);
