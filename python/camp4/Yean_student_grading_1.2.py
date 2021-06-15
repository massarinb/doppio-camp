x = 
#score = x
y = float(x)
z = int(x)

if x == y and x != z :
    print("ERROR score must be integer") 

elif x >= 80  and x <= 100 :
    print("score = ",x,"Grade = A")

elif x >= 70 and  x < 80 :
    print("score = ",x,"Grade = B")

elif x >= 60 and x < 70 :
    print("score = ",x,"Grade = C")

elif x >= 50  and x < 60 :
    print("score = ",x,"Grade = D")

elif x < 50 and x >= 0 :
    print("score = ",x,"Grade = F") 

else :
    print("ERROR score should be 0-100")
    
   
