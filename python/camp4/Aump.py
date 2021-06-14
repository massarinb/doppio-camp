

my_dict = {"S" : "Score" , "G" : "Grade"}
X = 79
Score = str(X)

if X >= 80 :
    print (my_dict["S"] + Score)
    print (my_dict["G"] + " = A")
elif X >= 70 and X < 80 :
    print (my_dict["S"] + Score)
    print (my_dict["G"] + " = B")
elif X >= 60 and X < 70 :
    print (my_dict["S"] + Score)
    print (my_dict["G"] + " = C")
elif X >= 50 and X < 60 :
    print (my_dict["S"] + Score)
    print (my_dict["G"] + " = D")
else :
    print (my_dict["S"] + Score)
    print (my_dict["G"] + " = F")