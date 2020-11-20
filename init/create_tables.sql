CREATE TABLE IF NOT EXISTS Musician(
  ssn INT NOT NULL,
  firstname VARCHAR(20),
  lastname VARCHAR(30),
  address TEXT,
  phone_number INT,
  PRIMARY KEY(ssn)
);

CREATE TABLE IF NOT EXISTS Album(
  album_id INT NOT NULL,
  title VARCHAR(50),
  author INT,
  PRIMARY KEY (album_id),
  FOREIGN KEY (author) REFERENCES Musician(ssn)
);

CREATE TABLE IF NOT EXISTS Song(
  song_id INT NOT NULL,
  name VARCHAR(50),
  length TIME,
  PRIMARY KEY(song_id)
);

CREATE TABLE IF NOT EXISTS Performance(
  performance_id INT NOT NULL,
  performance_time DATE,
  location TEXT,
  PRIMARY KEY (performance_id)
);

CREATE TABLE IF NOT EXISTS Record(
  ssn INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (ssn,song_id),
  FOREIGN KEY(ssn) REFERENCES Musician(ssn),
  FOREIGN KEY(song_id) REFERENCES Performance(performance_id)
);

CREATE TABLE IF NOT EXISTS Perf_record(
  ssn INT NOT NULL,
  performance_id INT NOT NULL,
  PRIMARY KEY(ssn, performance_id),
  FOREIGN KEY(ssn) REFERENCES Musician(ssn),
  FOREIGN KEY(performance_id) REFERENCES Performance(performance_id)
);

CREATE TABLE IF NOT EXISTS Appearance(
  song_id INT NOT NULL,
  album_id INT NOT NULL,
#  track_number INT,
  PRIMARY KEY (song_id, album_id),
  FOREIGN KEY(song_id) REFERENCES Song(song_id),
  FOREIGN KEY(album_id) REFERENCES Album(album_id)
);
