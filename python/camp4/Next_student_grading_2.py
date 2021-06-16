def grading_function (g_name,g_score) :
	if g_score >= 80 and g_score <= 100 :
		print(g_name,": Score = ",g_score,", Grade = A")
	elif g_score >= 70 and g_score < 80 :
		print(g_name,": Score = ",g_score,", Grade = B")
	elif g_score >= 60 and g_score < 70 :
		print(g_name,": Score = ",g_score,", Grade = C")
	elif g_score >= 50 and g_score < 60 :
		print(g_name,": Score = ",g_score,", Grade = D")
	elif g_score >= 0 and g_score < 50 :
		print(g_name,": Score = ",g_score,", Grade = F")


my_dict = {
	"Somsuk" : 90,
	"Somsri" : 84,
	"Apisit" : 75,
	"Phutimet" : 62,
	"Wanpen" : 49,
	"Keawkan" : 51,
	"Mana" : 60,
	"Manee" : 60,
	"Phiti" : 97,
	"Choojai" : 65,
	}

for x in my_dict :
	score = my_dict[x]
	grading_function(x,score)