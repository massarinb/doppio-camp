def my_grade_common(g_name, g_score):
    #scope function my_grade
    print("**********************")
    print("my_grade in common")
    print(g_name)
    print(g_score)
    if g_score >= 80:
        print(g_name + " got grade A")
    elif g_score >= 70:
        print(g_name + " got grade B")
    else:
        print("no grade")