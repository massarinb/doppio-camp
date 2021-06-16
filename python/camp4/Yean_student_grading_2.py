def grading_function(g_name, g_score):
    if g_score >= 80:
        print(g_name, ": Score :", g_score, "Grade = A")
    elif g_score >= 70 and g_score < 80:
        print(g_name, ": Score :", g_score, "Grade = B")
    elif g_score >= 60 and g_score < 70:
        print(g_name, ": Score :", g_score, "Grade = C") 
    elif g_score >= 50 and g_score < 60:
        print(g_name, ": Score :", g_score, "Grade = D")
    elif g_score < 50:
        print(g_name, " Score :", g_score, "Grade = F")   

my_dict = {
            "Sara" : 95,
            "Josh" : 82,
            "Jannie" : 75,
            "Laura" : 71,
            "Bobby" : 63,
            "Chanel" : 55,
            "Kiehls" : 43,
            "Cola" : 30,
            "Coke" : 23,
            "Sprite" : 15,
        
        }
for x in my_dict :
    score = my_dict[x]
    grading_function(x, score)

