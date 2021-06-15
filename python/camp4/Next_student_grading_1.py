x =  100.5
# x= Score of Student.
z = int(x) 
y = float(x)
	

if x >= 80 and x <= 100 and x == z :
	print("Score = ",x,",Grade = A") 

elif x >= 70 and x < 80 and x == z :
	print("Score = ",x,",Grade = B") 

elif x >= 60 and x < 70 and x == z :
	print("Score = ",x,",Grade = C") 

elif x >= 50 and x < 60 and x == z :
	print("Score = ",x,",Grade = D")  

elif x < 50 and x >= 0 and x == z :
	print("Score = ",x,",Grade = F") 

elif x == y and x != z :
	print("error number cannot be decimals") 

else :
	print("error score should be between 0 - 100 ")