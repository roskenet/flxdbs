#!/usr/bin/env python3
import psycopg2

try:
    conn = psycopg2.connect("dbname='postgres' user='postgres' host='localhost' password='postgres'")
except:
    print("Uh... What's wrong?")

cur = conn.cursor()
cur.execute('SELECT * FROM pg_database')
rows = cur.fetchall()

for row in rows:
    print(" ", row[0], " ", row[1])