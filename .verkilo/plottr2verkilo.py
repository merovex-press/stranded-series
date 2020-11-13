#!/usr/bin/env python3

import json
import yaml

pfile = "Untitled.pltr"
yfile = pfile.replace('.pltr','-pltr.yml')
print(pfile)
scenes = []
beats  = [] # Series Beats
books = {}
chapters = {}

with open(pfile) as f:
  data = json.loads(f.read())

with open(yfile,'w') as y:
  yaml.dump(data, y, indent=2)

# Populate book shelf with books in order
shelf_order = data['books']['allIds']
for i in shelf_order:
  books[str(i)] = data['books'][str(i)]
  books[str(i)]['cards'] = []

characters = data['characters']
for c in data['chapters']:
  i = str(c['id'])
  chapters[i] = c

# Assign Cards to the Series or Book
for card in data['cards']:
  if card['chapterId'] is None:
    beats.append(card)
  else:
    ch_id = str(card['chapterId'])
    b_id = str(chapters[ch_id]['bookId'])
    books[b_id]['cards'].append(card)
    scenes.append(card)


scenes = sorted(scenes, key=lambda i: i['chapterId'])
for i in range(len(scenes)):
  s = scenes[i]
  print(i, s['id'],s['title'],s['chapterId'])

# print(data.keys())
bid = chapters['3']['bookId']
book = books[str(bid)]

# print(chapters['3']['bookId'], book)
print(books['1'])
with open('dump.yml', 'w') as y:
  yaml.dump(books, y, indent=2)
