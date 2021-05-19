studentScore = 82
studentName = "Koi"

if studentScore >= 80:
    print("Score ",studentScore, " grade = A")
elif studentScore >= 70 and studentScore < 80:
    print("Score ",studentScore, " grade = B")
elif studentScore >= 60 and studentScore < 70:
    print("Score ",studentScore, " grade = C")
elif studentScore >= 50 and studentScore < 60:
    print("Score ",studentScore, " grade = D")
elif studentScore < 50:
    print("Score ",studentScore, " grade = F")