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
  ('cat_1', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_1.jpg'),
  ('cat_2', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_2.jpg'),
  ('cat_3', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_3.jpg'),
  ('cat_4', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_4.jpg'),
  ('cat_5', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_5.jpg'),
  ('cat_6', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_6.jpg'),
  ('cat_7', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_7.jpg'),
  ('cat_8', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_8.jpg'),
  ('cat_9', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_9.jpg'),
  ('cat_10', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_10.jpg');

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
  ('cat_1', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_1.jpg'),
  ('cat_2', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_2.jpg'),
  ('cat_3', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_3.jpg'),
  ('cat_4', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_4.jpg'),
  ('cat_5', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_5.jpg'),
  ('cat_6', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_6.jpg'),
  ('cat_7', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_7.jpg'),
  ('cat_8', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_8.jpg'),
  ('cat_9', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_9.jpg'),
  ('cat_10', 'C:/Users/19258/Desktop/Code/RithmSchool/week-10/docustore/backend/local_file_store/cat_10.jpg');
