import psycopg2
import matplotlib.pyplot as plt

username = 'Zemlyanuy_Daniel'
password = 'postgres'
database = 'Laboratory3'
host = 'localhost'
port = '5432'

query_1 = '''
SELECT device.user_id, Person.age , SUM(watched_time) AS total_watch_time 
FROM device
JOIN person ON device.user_id = person.user_id
WHERE person.age >= 35
GROUP BY device.user_id, age
ORDER BY total_watch_time DESC
'''
query_2 = '''
SELECT device_type, COUNT(device_id) AS device_count
FROM device
GROUP BY device_type
ORDER BY device_count DESC
'''

query_3 = '''
SELECT video.genre, person.age
FROM device
JOIN person ON device.user_id = person.user_id
JOIN video ON device.video_url = video.video_url
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
print(type(conn))

with conn:
    print("Database opened successfully")
    cur = conn.cursor()

    print('Task 1')
    cur.execute(query_1)
    users = []
    times = []

    for row in cur:
        users.append(row[0])
        times.append(row[2])
        print(row)

    print('\nTask 2')
    cur.execute(query_2)
    types = []
    counts = []

    for row in cur:
        types.append(row[0])
        counts.append(row[1])
        print(row)

    print('\nTask 3')
    cur.execute(query_3)
    genres = []
    ages = []

    for row in cur:
        genres.append(row[0])
        ages.append(row[1])
        print(row)