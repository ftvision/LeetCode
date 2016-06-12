#!/usr/bin/python
str = raw_input("Enter your input: ");


+ Addition	Adds values on either side of the operator.	a + b = 30
- Subtraction	Subtracts right hand operand from left hand operand.	a – b = -10
* Multiplication	Multiplies values on either side of the operator	a * b = 200
/ Division	Divides left hand operand by right hand operand	b / a = 2
% Modulus	Divides left hand operand by right hand operand and returns remainder	b % a = 0
** Exponent	Performs exponential (power) calculation on operators	a**b =10 to the power 20
//	Floor Division - The division of operands where the result is the quotient in which the digits after the decimal point are removed.	9//2 = 4 and 9.0//2.0 = 4.0

& Binary AND	Operator copies a bit to the result if it exists in both operands	(a & b) (means 0000 1100)
| Binary OR	It copies a bit if it exists in either operand.	(a | b) = 61 (means 0011 1101)
^ Binary XOR	It copies the bit if it is set in one operand but not both.	(a ^ b) = 49 (means 0011 0001)
~ Binary Ones Complement	It is unary and has the effect of 'flipping' bits.	(~a ) = -61 (means 1100 0011 in 2's complement form due to a signed binary number.
<< Binary Left Shift	The left operands value is moved left by the number of bits specified by the right operand.	a << = 240 (means 1111 0000)
>> Binary Right Shift	The left operands value is moved right by the number of bits specified by the right operand.	a >> = 15 (means 0000 1111)

print(2+3*4)

True, False, and, or, not, !=, ==, >=
list = [];

indexing	[ ]	Access an element of a sequence
concatenation	+	Combine sequences together
repetition	*	Concatenate a repeated number of times
membership	in	Ask whether an item is in a sequence
length	len	Ask the number of items in the sequence
slicing	[ : ]	Extract a part of a sequence

append	alist.append(item)	Adds a new item to the end of a list
insert	alist.insert(i,item)	Inserts an item at the ith position in a list
pop	alist.pop()	Removes and returns the last item in a list
pop	alist.pop(i)	Removes and returns the ith item in a list
sort	alist.sort()	Modifies a list to be sorted
reverse	alist.reverse()	Modifies a list to be in reverse order
del	del alist[i]	Deletes the item in the ith position
index	alist.index(item)	Returns the index of the first occurrence of item
count	alist.count(item)	Returns the number of occurrences of item
remove	alist.remove(item)	Removes the first occurrence of item

list(range(10,1,-1))
[10, 9, 8, 7, 6, 5, 4, 3, 2]

list(range(5,10))
[5, 6, 7, 8, 9]

>>> myName = "David"
>>> myName[3]
'i'

center	astring.center(w)	Returns a string centered in a field of size w
count	astring.count(item)	Returns the number of occurrences of item in the string
ljust	astring.ljust(w)	Returns a string left-justified in a field of size w
lower	astring.lower()	Returns a string in all lowercase
rjust	astring.rjust(w)	Returns a string right-justified in a field of size w
find	astring.find(item)	Returns the index of the first occurrence of item
split	astring.split(schar)	Splits a string into substrings at schar

For example, you can change an item in a list by using indexing and assignment. With a string that change is not allowed.

>>> myName[0]='X'

Traceback (most recent call last):
  File "<pyshell#84>", line 1, in -toplevel-
    myName[0]='X'
TypeError: object doesn't support item assignment
>>>

 myTuple = (2,True,4.96)

>>> mySet = {3,6,"cat",4.5,False}
>>> mySet
{False, 4.5, 3, 6, 'cat'}
>>>

membership	in	Set membership
length	len	Returns the cardinality of the set
|	  aset | otherset	Returns a new set with all elements from both sets
&	  aset & otherset	Returns a new set with only those elements common to both sets
-	  aset - otherset	Returns a new set with all items from the first set not in second
<=	aset <= otherset	Asks whether all elements of the first set are in the second

union	aset.union(otherset)	Returns a new set with all elements from both sets
intersection	aset.intersection(otherset)	Returns a new set with only those elements common to both sets
difference	aset.difference(otherset)	Returns a new set with all items from first set not in second
issubset	aset.issubset(otherset)	Asks whether all elements of one set are in the other
add	aset.add(item)	Adds item to the set
remove	aset.remove(item)	Removes item from the set
pop	aset.pop()	Removes an arbitrary element from the set
clear	aset.clear()	Removes all elements from the set

len((1, 2, 3))	3	Length
(1, 2, 3) + (4, 5, 6)	(1, 2, 3, 4, 5, 6)	Concatenation
('Hi!',) * 4	('Hi!', 'Hi!', 'Hi!', 'Hi!')	Repetition
3 in (1, 2, 3)	True	Membership
for x in (1, 2, 3): print x,	1 2 3	Iteration


>>> capitals = {'Iowa':'DesMoines','Wisconsin':'Madison'}
>>> capitals
{'Wisconsin': 'Madison', 'Iowa': 'DesMoines'}
>>>
print(capitals['Iowa'])
capitals['Utah']='SaltLakeCity'

[]	myDict[k]	Returns the value associated with k, otherwise its an error
in	key in adict	Returns True if key is in the dictionary, False otherwise
del	del adict[key]	Removes the entry from the dictionary
>>> phoneext.keys()
dict_keys(['brad', 'david'])
>>> list(phoneext.keys())
['brad', 'david']
>>> phoneext.values()
dict_values([1137, 1410])
>>> list(phoneext.values())
[1137, 1410]
>>> phoneext.items()
dict_items([('brad', 1137), ('david', 1410)])
>>> list(phoneext.items())
[('brad', 1137), ('david', 1410)]

keys	adict.keys()	Returns the keys of the dictionary in a dict_keys object
values	adict.values()	Returns the values of the dictionary in a dict_values object
items	adict.items()	Returns the key-value pairs in a dict_items object
get	adict.get(k)	Returns the value associated with k, None otherwise
get	adict.get(k,alt)	Returns the value associated with k, alt otherwise

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'};

print "dict['Name']: ", dict['Name']
print "dict['Age']: ", dict['Age']

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'};

dict['Age'] = 8; # update existing entry
dict['School'] = "DPS School"; # Add new entry

del dict['Name']; # remove entry with key 'Name'
dict.clear();     # remove all entries in dict
del dict ;        # delete entire dictionary

new_dict = {}

print(aName, "is", age, "years old.")
print("%s is %d years old." % (aName, age))

Table 9: String Formatting Conversion Characters
Character	Output Format
d, i	Integer
u	Unsigned integer
f	Floating point as m.ddddd
e	Floating point as m.ddddde+/-xx
E	Floating point as m.dddddE+/-xx
g	Use %e for exponents less than −4−4 or greater than +5+5, otherwise use %f
c	Single character
s	String, or any Python data object that can be converted to a string by using the str function.
%	Insert a literal % character
Modifier	Example	Description
number	%20d	Put the value in a field width of 20
-	%-20d	Put the value in a field 20 characters wide, left-justified
+	%+20d	Put the value in a field 20 characters wide, right-justified
0	%020d	Put the value in a field 20 characters wide, fill in with leading zeros.
.	%20.2f	Put the value in a field 20 characters wide with 2 characters to the right of the decimal point.
(name)	%(name)d	Get the value from the supplied dictionary using name as the key.
>>> itemdict = {"item":"banana","cost":24}
>>> print("The %(item)s costs %(cost)7.1f cents"%itemdict)
The banana costs    24.0 cents
>>>


>>> while counter <= 5:
...     print("Hello, world")
...     counter = counter + 1
>>> for item in [1,3,6,2,5]:
...    print(item)

for aword in wordlist:
    for aletter in aword:
        letterlist.append(aletter)

if n<0:
   print("Sorry, value is negative")
else:
   print(math.sqrt(n))

if score >= 90:
   print('A')
elif score >=80:
   print('B')
elif score >= 70:
   print('C')

>>> sqlist=[x*x for x in range(1,11)]
>>> sqlist
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
>>>

>>> sqlist=[x*x for x in range(1,11) if x%2 != 0]
>>> sqlist
[1, 9, 25, 49, 81]
>>>

>>> try:
       print(math.sqrt(anumber))
    except:
       print("Bad Value for square root")
       print("Using absolute value instead")
       print(math.sqrt(abs(anumber)))

>>> def square(n):
...    return n**2


class Fraction:

    def __init__(self,top,bottom):

        self.num = top
        self.den = bottom
    def show(self):
     		print(self.num,"/",self.den)
    def __str__(self):
    		return str(self.num)+"/"+str(self.den)

    def __add__(self,otherfraction):

     newnum = self.num*otherfraction.den + self.den*otherfraction.num
     newden = self.den * otherfraction.den

     return Fraction(newnum,newden)

    def __eq__(self, other):
    		firstnum = self.num * other.den
    		secondnum = other.num * self.den

    		return firstnum == secondnum

    Implement the remaining relational operators (__gt__, __ge__, __lt__, __le__, and __ne__)

def printinfo( name, age = 35 ):
   "This prints a passed info into this function"
   print "Name: ", name
   print "Age ", age
   return;

# Function definition is here
def printinfo( arg1, *vartuple ):
   "This prints a variable passed arguments"
   print "Output is: "
   print arg1
   for var in vartuple:
      print var
   return;


lambda [arg1 [,arg2,.....argn]]:expression
sum = lambda arg1, arg2: arg1 + arg2;