def grading_function (g_name, g_score):
    if g_score >=80:
        print(g_name,": Score = ",g_score, ", Grade = A")
    elif g_score >=70 and g_score <80:
        print(g_name,": Score = ",g_score, ", Grade = B")
    elif g_score >=60 and g_score <70:
        print(g_name,": Score = ",g_score, ", Grade = C")
    elif g_score >=50 and g_score <60:
        print(g_name,": Score = ",g_score, ", Grade = D")
    elif g_score <50:
        print(g_name,": Score = ",g_score, ", Grade = F")

my_dict = {
    "Ann": 90,
    "Bob": 85,
    "Carol": 80,
    "Daniel": 75,
    "Elise": 70,
    "Fin": 65,
    "George": 60,
    "Henry": 55,
    "Ian": 50,
    "Jack": 45,
    }

for x in my_dict: 
    score = my_dict[x]
    grading_function(x, score)

