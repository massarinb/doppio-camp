def studentgrade_function(name, Score):
  if Score >= 80:
    print(name, 'Score',Score, " grade = A")
  elif Score >= 70 and Score < 80:
    print(name, "Score",Score, " grade = B")
  elif Score >= 60 and Score < 70:
    print(name, "Score",Score, " grade = C")
  elif Score >= 50 and Score < 60:
    print(name, "Score",Score, " grade = D")
  elif Score < 50:
    print(name, "Score",Score, " grade = F")

print("===============================================================")
Score_dict = {'nile':74, "donut":69, "praew":85, "gift":73, "elle":59, "mook":79, "tim":88, "tar":74, "fang":61, "chai":88}

for name_1 in Score_dict:
  score_1 = Score_dict[name_1]
  studentgrade_function(name_1, score_1)