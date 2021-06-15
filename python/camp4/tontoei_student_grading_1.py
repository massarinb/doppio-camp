name = 'tontoei'
score = 30
x = str(score)
g = ' grade'

if score >=80 :
	print(name + ' equal to ' + x + g + ' =A')
elif score >=70 and score <80:
	print(name + ' equal to ' + x + g + ' =B')
elif score >=60 and score <70:
	print(name + ' equal to ' + x + g + ' =C')
elif score >=50 and score <60:
	print(name + ' equal to ' + x + g + ' =D')
else:
	print(name + ' equal to ' + x + g + ' =F')