\echo 'Delete and recreate docustore db?'
\prompt 'Return for yes or control-C to cancel > ' foo

DROP DATABASE docustore;
CREATE DATABASE docustore;
\connect docustore

CREATE TABLE images (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  location TEXT NOT NULL);

INSERT INTO images (name, location) VALUES
  ('cat_1', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_1.jpg'),
  ('cat_2', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_2.jpg'),
  ('cat_3', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_3.jpg'),
  ('cat_4', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_4.jpg'),
  ('cat_5', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_5.jpg'),
  ('cat_6', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_6.jpg'),
  ('cat_7', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_7.jpg'),
  ('cat_8', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_8.jpg'),
  ('cat_9', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_9.jpg'),
  ('cat_10', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_10.jpg');

\echo 'Delete and recreate docustore_test db?'
\prompt 'Return for yes or control-C to cancel > ' foo

DROP DATABASE docustore_test;
CREATE DATABASE docustore_test;
\connect docustore_test

CREATE TABLE images (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  location TEXT NOT NULL);

INSERT INTO images (name, location) VALUES
  ('cat_1', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_1.jpg'),
  ('cat_2', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_2.jpg'),
  ('cat_3', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_3.jpg'),
  ('cat_4', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_4.jpg'),
  ('cat_5', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_5.jpg'),
  ('cat_6', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_6.jpg'),
  ('cat_7', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_7.jpg'),
  ('cat_8', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_8.jpg'),
  ('cat_9', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_9.jpg'),
  ('cat_10', 'https://docustore-bucket.s3.us-east-2.amazonaws.com/cat_10.jpg');
