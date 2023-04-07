non_term=["S","A","B","C"]
term=["a","b","c","p","$"]

grammar={"S":["ABC","C"],"A":["a","bB","@"],"B":["p","@"],"C":["c"]}

def First(symbol):
  first=set([])
  #if symbol is terminal
  if(symbol[0] in term or symbol=="@"):
    first.add(symbol[0])
    return first
  #symbol length>1 (ABC)
  if len(symbol)>1:
    for sym in symbol:
      first2=First(sym)
      if '@' in first2:
        first=first.union(first2-{'@'})
      else:
        first=first.union(first2)
  
  else:
    for production in grammar[symbol[0]]:
      if(production[0] in term):
        first.add(production[0])
      elif(production[0]=="@"):
        first.add(production[0])
      elif(production[0] in non_term):
          for string in production:
            first2=First(string)
            if("@" in first2):
              first=first.union((first2-{"@"}))
            else:
              first=first.union(first2)
              break
  return first


print("First for each Non-term are:")
for nt in non_term:
  print(f'{nt} : {First(nt)}')


def get_key(val):
    keys=set([])
    for key, value in grammar.items():
        for string in value:
          for letter in string:
           if val == letter:
             keys.add(key)
    return keys

print(get_key("a"))

def Follow(symbol):
  follow=set([])
  if(symbol=="S"):
    follow.add("$")
  keys=get_key(symbol)
  for k in keys:
    for production in grammar[k]:
      for i in range(0,len(production)):
          if production[i]==symbol :
            j=i
            if j!=len(production)-1:
              for j in range(i,len(production)):
                first=First(production[j+1])
                if('@' in  first):
                  follow=follow.union(Follow(k))
                  follow=follow.union((first-{'@'}))
                else:
                  follow=follow.union(first)
                  break
            elif(production[i]==symbol and i==len(production)-1):
                follow=follow.union(Follow(k))
            elif(production[i]==symbol and symbol==k):
                return
            
  return follow 


def make_Table():  #Make first and follow table
  table_dict=dict({})
  for nt in non_term:
    table_dict[nt]=[First(nt),Follow(nt)]
  return table_dict


print("Non-term  \t   First  \t \t   Follow")
table=make_Table()
for k in table.keys():
  print(f'{k}  \t\t  {table[k][0]}         {table[k][1]}')


def LL1Table():  #make LL(1) table
  S={}
  A={}
  B={}
  C={}
  ll={"S":S,"A":A,"B":B,"C":C}

  for k in ll.keys():
    for t in term:
      ll[k][t]=list([])
  table=make_Table()
  for nt in non_term:
    for prod in grammar[nt]:
      first=First(prod)
      for f in first:
        if f=='@':
         for fol in table[nt][1]:
          ll[nt][fol].append(f'{nt}->epsilon')
        elif(f in table[nt][0]):  
          ll[nt][f].append(f'{nt}->{prod}')
  for k in ll.keys():
    ll[k]=dict(sorted(ll[k].items()))
    print(f'{k}:=\t',end='')
    for s in ll[k]:
      print(f'{s}: {ll[k][s]}\t',end='')
    print("\n")


print("LL(1) Parsing Table:\n")
print("Non-term")
LL1Table()