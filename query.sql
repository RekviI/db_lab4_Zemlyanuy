-- Запит №1 Кількість часу витраченного на перегляд кожною особою старшою за 35 років у порядку спадання
SELECT device.user_id, person.age , SUM(watched_time) AS total_watch_time
FROM device
JOIN person ON device.user_id = person.user_id
WHERE person.age >= 35
GROUP BY device.user_id, age
ORDER BY total_watch_time DESC;

-- Запит №2 Кількість кожного з девайсів з яких відбувався перегляд
SELECT device_type, COUNT(device_id) AS device_count
FROM device
GROUP BY device_type
ORDER BY device_count DESC;

-- Запит №3 Вивести жанр кожного відеоролика з віком осіб які його дивилися 
SELECT video.genre, person.age
FROM device
JOIN person ON device.user_id = person.user_id
JOIN video ON device.video_url = video.video_url;

