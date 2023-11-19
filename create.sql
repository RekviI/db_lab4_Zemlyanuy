CREATE TABLE Person
(
  user_id VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  gender CHAR(10) NOT NULL,
  subscription CHAR(15) NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE Video
(
  genre CHAR(15) NOT NULL,
  video_url VARCHAR(100) NOT NULL,
  PRIMARY KEY (video_url)
);

CREATE TABLE Device
(
  watched_time FLOAT NOT NULL,
  device_id VARCHAR(50) NOT NULL,
  device_type CHAR(15) NOT NULL,
  user_id VARCHAR(50) NOT NULL,
  video_url VARCHAR(100) NOT NULL,
  PRIMARY KEY (device_id),
  FOREIGN KEY (user_id) REFERENCES Person(user_id),
  FOREIGN KEY (video_url) REFERENCES Video(video_url)
);