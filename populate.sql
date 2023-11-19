--POPULATE Person TABLE
INSERT INTO Person(user_id, age, gender, subscription)
VALUES('eb232','56','Female','Premium');
INSERT INTO Person(user_id, age, gender, subscription)
VALUES('db549','52','Male','Premium');
INSERT INTO Person(user_id, age, gender, subscription)
VALUES('dd844','14','Female','Premium');
INSERT INTO Person(user_id, age, gender, subscription)
VALUES('ab201','36','Male','Premium');
INSERT INTO Person(user_id, age, gender, subscription)
VALUES('df700','31','Male','Free');
INSERT INTO Person(user_id, age, gender, subscription)
VALUES('bf514','53','Male','Premium');
INSERT INTO Person(user_id, age, gender, subscription)
VALUES('da1','10','Female','Free');

--POPULATE Video TABLE
INSERT INTO Video(video_url, genre)
VALUES('https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'Sci-Fi');
INSERT INTO Video(video_url, genre)
VALUES('https://www.youtube.com/watch?v=6Cr_8tvvQ0k&list=LL&index=110', 'Comedy');
INSERT INTO Video(video_url, genre)
VALUES('https://www.youtube.com/watch?v=l9m-rc5f6wo&list=LL&index=26', 'Comedy');
INSERT INTO Video(video_url, genre)
VALUES('https://www.youtube.com/watch?v=y1qDzW_yWko', 'Documentary');
INSERT INTO Video(video_url, genre)
VALUES('https://www.youtube.com/watch?v=30jrmzzgHLc&pp=ygUJbmlnaHRjYWxs', 'Action');
INSERT INTO Video(video_url, genre)
VALUES('https://www.youtube.com/watch?v=ioiG_BNTuOA', 'Drama');
INSERT INTO Video(video_url, genre)
VALUES('https://www.youtube.com/watch?v=Y1IgAEejvqM', 'Drama');

--POPULATE Device TABLE
INSERT INTO Device(device_id, watched_time, device_type, user_id, video_url)
VALUES('cd11', '90.0445','Smartphone', 'eb232', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ');
INSERT INTO Device(device_id, watched_time, device_type, user_id, video_url)
VALUES('bc85', '68.9734','Desktop', 'db549', 'https://www.youtube.com/watch?v=6Cr_8tvvQ0k&list=LL&index=110');
INSERT INTO Device(device_id, watched_time, device_type, user_id, video_url)
VALUES('bd50', '42.5113','Tablet', 'dd844', 'https://www.youtube.com/watch?v=l9m-rc5f6wo&list=LL&index=26');
INSERT INTO Device(device_id, watched_time, device_type, user_id, video_url)
VALUES('od38', '53.3166','Laptop', 'ab201', 'https://www.youtube.com/watch?v=y1qDzW_yWko');
INSERT INTO Device(device_id, watched_time, device_type, user_id, video_url)
VALUES('fd31', '69.4377','Laptop', 'df700', 'https://www.youtube.com/watch?v=30jrmzzgHLc&pp=ygUJbmlnaHRjYWxs');
INSERT INTO Device(device_id, watched_time, device_type, user_id, video_url)
VALUES('ae83', '41.8109','Laptop', 'bf514', 'https://www.youtube.com/watch?v=ioiG_BNTuOA');
INSERT INTO Device(device_id, watched_time, device_type, user_id, video_url)
VALUES('oc85', '63.9790','SmartTV', 'da1', 'https://www.youtube.com/watch?v=Y1IgAEejvqM');
