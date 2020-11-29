import csv 
import pprint 
import xml.etree.ElementTree as ET
import matplotlib.pyplot as plt

def parseXML(xmlfile):
  tree = ET.parse(xmlfile) 
  return tree

hx = {}
x = parseXML("Stranded.scriv/Files/writing.history")

pp = pprint.PrettyPrinter(indent=4)
root = x.getroot()
print(root)
for child in root:
  # print(child.tag, child.attrib, child.text)
  hx[child.text] = child.attrib
  dtwc = child.attrib.get('dtwc',0)
  hx[child.text] = {
    'dwc': int(child.attrib['dwc']),
    'owc': int(child.attrib['owc']),
    'dtwc': int(dtwc)
  }

hy = {}
dtwc = None
for k in reversed(sorted(hx.keys())):
  if dtwc == None:
    dtwc = hx[k]['dtwc']
  
  hx[k]['dtwc'] = dtwc
  hy[k] = dtwc
  dtwc -= hx[k]['dwc']
  

pp.pprint(hx)
pp.pprint(hy)
x = hx.keys()
y = []
for k in x:
  y.append(hx[k]['dtwc'])

print(y)
x_pos = [i for i, _ in enumerate(hx.keys())]
print(x_pos)

plt.bar(x_pos, y, color='green')
plt.xlabel("Energy Source")
plt.ylabel("Energy Output (GJ)")
plt.title("Energy output from various fuel sources")

plt.xticks(x_pos, x)

plt.show()
