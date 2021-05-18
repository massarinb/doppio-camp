##Indent
#if 5 > 2:
# print("Five is greater than two!")
#        print("Five is greater than two!")

##!!! Be careful when copy code "" can be error
#name = “Reena”

##Variable
#name = "Reena"
#year_number = 2021
#year_string = "2021"

#print(type(year_number))
#print(type(year_string))

##Case sensitive
#id = 1
#Id = "TC001"
#print(id)
#print(Id)


# empty range
print(list(range(0)))

# using range(stop)
print(list(range(10)))

# using range(start, stop)
print(list(range(1, 10)))


# get vs [] for retrieving elements
my_dict = {'name': 'Jack', 'age': 26}

# Output: Jack
print(my_dict['name'])

# Output: 26
print(my_dict.get('age'))

# Trying to access keys which doesn't exist throws error
# Output None
print(my_dict.get('address'))

# KeyError
print(my_dict['address'])