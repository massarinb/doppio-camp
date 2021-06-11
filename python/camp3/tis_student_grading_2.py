student_list = {"June": 90, "James": 85, "Jack": 80, "Jake": 75, "Joe": 70, "Jay": 65, "Joy": 60, "Job": 55, "Jin": 50, "John": 45}

def grading_system(name, score):

    if score >= 80:
        print (name + " - Score = " + str(score) + " Grade A")
    elif score >= 70 and score < 80:
        print (name + " - Score = " + str(score) + " Grade B")
    elif score >= 60 and score < 70:
        print (name + " - Score = " + str(score) + " Grade C")
    elif score >= 50 and score < 60:
        print (name + " - Score = " + str(score) + " Grade D")
    elif score < 50:
        print (name + " - Score = " + str(score) + " Grade F")

for student_name, student_score in student_list.items():
    
    grading_system(student_name,student_score)
