
def my_grade(g_name, g_score):
    #scope function my_grade
    print("my_grade")
    print(g_name)
    print(g_score)
    if g_score >= 80:
        print(g_name + " got grade A")
    elif g_score >= 70:
        print(g_name + " got grade B")
    else:
        print("no grade")

from python.camp3.common_function import my_grade_common
from common_function import *

#scope global
name = "reena"
score = 80

print("global")
print(name)
print(score)

my_grade(name, score)

my_grade_common(name, score)

print("=============================")
my_dict = {"Ann":90, "Bob": 85}

for x in my_dict:
    score_t = my_dict[x]
    print("name x: " + x)
    my_grade(x, score_t)





