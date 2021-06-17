def function_grading (student_name , student_score) :
    if student_score >= 80 :
        print (student_name , ": Score =", student_score , "Grade = A")
    elif student_score >= 70 and student_score < 80 :
        print (student_name , ": Score =" , student_score , "Grade = B")
    elif student_score >= 60 and student_score < 70 :
        print (student_name , ": Score =" , student_score , "Grade = C")
    elif student_score >= 50 and student_score < 60 :
        print (student_name , ": Score =" , student_score , "Grade = D")
    elif student_score < 50 :
        print (student_name , ": Score =" , student_score , "Grade = F")

my_dict = {
    "Percy Jackson" :  81,
    "Annabeth Chase" : 80,
    "Nico di Angelo" : 79,
    "Luke Castellan" : 70,
    "Grover Underwood" : 69,
    "Clarisse La Rue" : 60,
    "Tyson" : 59,
    "Sally Jackson" : 50,
    "Sadie Kane" : 49,
}

for x in my_dict:
    Score = my_dict[x]
    function_grading(x , Score)