#!/usr/bin/env python3
import psycopg2

try:
    conn = psycopg2.connect("dbname='local_content_factory_db' user='postgres' host='localhost' password='postgres'")
except:
    print("Uh... What's wrong?")

cur = conn.cursor()
cur.execute('SELECT * FROM zprod_data.article LIMIT 10')
rows = cur.fetchall()

for row in rows:
    print(" ", row[0], " ", row[1])