import yaml

file = "md.yml"

first = []
last = []
contents = []
n = 0
with open(file, 'r') as f:
  for line in  f.readlines():
    n += 1
    f, l = line.strip().split(" ",2)
    print(n,f,l)
    # contents.append(l)
    first.append(f)
    last.append(l)

first = list(dict.fromkeys(first))
last = list(dict.fromkeys(last))
first.sort()
last.sort()

names = {
  'first': first,
  'last': last
}
y = yaml.dump(names)
print(y)
with open('maryland-names.yml','w') as f:
  f.write(y)
