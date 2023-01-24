student_list = {"Sarah": 92, "Michael": 88, "Jessica": 84, "Jacob": 78, "Emily": 74, "Matthew": 71, "Amanda": 68, "Ashley": 62, "Nicholas": 56, "Brandon": 49}

def assign_grade(student_name, student_score):
    if student_score >= 80:
        print (student_name + ": Score = " + str(student_score) + ", Grade A")
    elif student_score >= 70 and student_score < 80:
        print (student_name + ": Score = " + str(student_score) + ", Grade B")
    elif student_score >= 60 and student_score < 70:
        print (student_name + ": Score = " + str(student_score) + ", Grade C")
    elif student_score >= 50 and student_score < 60:
        print (student_name + ": Score = " + str(student_score) + ", Grade D")
    elif student_score < 50:
        print (student_name + ": Score = " + str(student_score) + ", Grade F")

for student_name, student_score in student_list.items():
    assign_grade(student_name,student_score)



