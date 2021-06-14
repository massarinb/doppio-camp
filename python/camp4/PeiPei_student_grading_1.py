#Conditions
#Score >= 80 Then print “Score = <value>, Grade = A”
#Score >=70 and <80 Then print “Score = <value>, Grade = B”
#Score >=60 and <70 Then print “Score = <value>, Grade = C”
#Score >=50 and <60 Then print “Score = <value>, Grade = D”
#Score <50 Then print “Score = <value>, Grade = F”

my_dict = {'s' : 'Score' , 'g' : 'Grade'}
x = 55
score = str(x)

if x >= 80 :
    print (my_dict['s'] + score)
    print (my_dict['g'] + ' = A')
elif x >= 70 and x < 80 :
    print (my_dict['s'] + score)
    print (my_dict['g'] + ' = B')
elif x >= 60 and x < 70 :
    print (my_dict['s'] + score)
    print (my_dict['g'] + ' = C')
elif x >= 50 and x < 60 :
    print (my_dict['s'] + score)
    print (my_dict['g'] + ' = D')
else :
    print (my_dict['s'] + score)
    print (my_dict['g'] + ' = F')
