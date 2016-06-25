import csv
import random
import string


def get_random_chars(length=5):
    chars = []
    for i in range(length):
        chars.append(random.choice(string.ascii_letters))
    return ''.join(chars)

with open('data.csv', 'wb') as csv_file:
    writer = csv.writer(csv_file, delimiter=',')
    writer.writerow(['column1', 'column2', 'column3', 'column4', 'column5'])
    for i in range(400000):
        writer.writerow([get_random_chars(length=1000), get_random_chars(length=1000),get_random_chars(length=1000),get_random_chars(length=1000),get_random_chars(length=1000)])
        

