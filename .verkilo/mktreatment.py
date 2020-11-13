#!/usr/bin/env python3

from liquid import Liquid

from datetime import datetime

import os
import re
import operator
import frontmatter

PATH = "./src"
books = {}
book = None
scenes = []

with open('.verkilo/templates/treatment.liquid') as f:
  book = Liquid(f, liquid_config={'debug': False, 'mode': 'python', 'strict': False})

with open('.verkilo/templates/treatment-scene.liquid') as f:
  scene = Liquid(f, liquid_config={'debug': False})

class Scene:
  def __init__(self,fn,metadata):
    self.file = fn
    self.metadata = metadata
    for k in metadata.keys():
      self.__setattr__(k,metadata[k])

    attrs = [
      'title', 'summary','date','place','tasks','characters'
    ]
    for a in attrs:
      v = None
      if a in metadata.keys():
        v = metadata[a]
        
      self.__setattr__(a,v)

    self.order = int(os.path.split(fn)[1].split('-')[0])

class Book:
  def __init__(self,root_dir):
    self.root_dir = root_dir
    self.metadata = {}
    self.files = []
    self.__scenes = []
    self.title = "Untitled"
    self.summary = ""
  
  def add_file(self,fn):
    self.files.append(fn)
    self.files.sort()
    metadata = vars(frontmatter.load(fn))['metadata']

    if 'scene' in metadata.keys():
      scene = Scene(fn, metadata['scene'])
      self.__scenes.append(scene)
    elif 'rights' in metadata.keys():
      self.metadata = metadata
      self.title = metadata['title']
      if 'summary' in metadata.keys():
        self.summary = metadata['summary']

  def scenes(self):
    return sorted(self.__scenes, key=operator.attrgetter("order"))

def process_treatments():
  now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
# iterate source for changed book directories
  for root, d_names, f_names in os.walk(PATH):
    for fn in f_names:
      if fn.endswith(".md"):
        if root not in books.keys():
          books[root] = Book(root)
        books[root].add_file(os.path.join(root, fn))

  for key in books.keys():
    scenes = []
    for s in books[key].scenes():
      scenes.append(scene.render(scene=s))

    content = book.render(book=books[key], scenes=scenes, timestamp=now)
    content = re.sub('\n{2,}','\n\n',content)

    fn = "./canon/80-Treatments/" + os.path.split(books[key].root_dir)[1] + ".mkd"
    with open(fn, 'w') as writer:
      writer.write(content)

if __name__ == "__main__":  
  process_treatments()
