student_list = {
    'cartoon': 85,
    'best': 80,
    'tontoey':75,
    'peipei':40,
    'yeen': 71,
    'next': 55,
    'champ': 24,
    'nut': 66,
    'reena':100,
    'moo': 101,
}

def gradeFunction(name,score):
    if (score >= 80 and score <= 100):
        print(name,'Score: ',score,'Grade = A')
    elif (score >=70 and score < 80):
        print(name,'Score: ',score,'Grade = B')
    elif (score >=60 and score < 70):
        print(name,'Score: ',score,'Grade = C')
    elif (score >=50 and score < 60):
        print(name,'Score: ',score,'Grade = D')
    elif (score < 50):
        print(name,'Score: ',score,'Grade = F')   

for x in student_list:
    result = student_list[x]
    gradeFunction(x,result)