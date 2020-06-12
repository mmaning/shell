from collections import Counter
ht=dict()
f=open("/Users/nima/github/shell/data/access10.log", "r")
a=f.readlines()
f.close()
for line in a:
    ip, date=line.split()
    if date in ht:
        ht[date].append(ip)
    else:
        ht[date]=[ip]

for date in ht.keys():
    print(date,"======")
    Counter(ht[date]).most_common(2)