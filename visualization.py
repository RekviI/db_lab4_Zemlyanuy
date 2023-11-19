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

    cur.execute(query_1)
    users = []
    times = []

    for row in cur:
        users.append(row[0])
        times.append(row[2])

    cur.execute(query_2)
    types = []
    counts = []

    for row in cur:
        types.append(row[0])
        counts.append(row[1])
    
    cur.execute(query_3)
    genres = []
    ages = []

    for row in cur:
        genres.append(row[0])
        ages.append(row[1])

    # # Завдання 1
    # plt.bar(users, times, width=0.5)
    # plt.title('Кількість часу витраченого на перегляд кожною особою старшою за 35 років у порядку спадання')
    # plt.xlabel('Користувачі')
    # plt.xticks(users)
    # plt.ylabel('Кількість часу, годин')

    # # Завдання 2
    # plt.pie([el for el in counts if el != 0], labels=[el[0] for el in zip(types, counts) if el[1] != 0], autopct='%1.2f%%')
    # plt.title('Кількість кожного з девайсів з яких відбувався перегляд')

    # # Завдання 3
    # plt.plot(genres, ages)
    # plt.title('Залежність жанру від віку осіб які його дивилися')
    # plt.xlabel('Вік, років')
    # plt.ylabel('Жанр')
    # for a, b in zip(genres, ages):
    #     plt.annotate(b, xy=(a, b), xytext=(7, 2), textcoords='offset points')

    # Виведення всіх завдань
    figure, (bar_ax, pie_ax, graph_ax) = plt.subplots(1, 3)
    bar = bar_ax.bar(users, times, label='Total')
    bar_ax.bar_label(bar, label_type='center')
    bar_ax.set_xticks(users)
    bar_ax.set_xticklabels(users)
    bar_ax.set_xlabel('Користувачі')
    bar_ax.set_ylabel('Кількість часу, годин')
    bar_ax.set_title('Кількість часу витраченого на перегляд кожною\n особою старшою за 35 років у порядку спадання')

    pie_ax.pie([el for el in counts if el != 0], labels=[el[0] for el in zip(types, counts) if el[1] != 0], autopct='%1.2f%%')
    pie_ax.set_title('Кількість кожного з девайсів\n з яких відбувався перегляд')

    mark_color = 'blue'
    graph_ax.plot(genres, ages, color=mark_color, marker='o')

    for a, b in zip(genres, ages):
        graph_ax.annotate(b, xy=(a, b), color=mark_color,
                          xytext=(7, 2), textcoords='offset points')

    graph_ax.set_xlabel('Жанр')
    graph_ax.set_ylabel('Вік, років')
    graph_ax.set_title('Залежність жанру від віку осіб які його дивилися')

    mng = plt.get_current_fig_manager()
    mng.resize(1600, 900)

plt.show()