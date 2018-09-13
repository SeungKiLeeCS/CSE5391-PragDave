
grade = ""

guess = 1

n = 50

print ("Imma guess the number between 1 and 100")
while (grade != "y"):
    grade = input("is the number " + str(n) + "(y/l/h)")
    if (grade == "l"):
        n = n+(int(n/(guess)))
        guess = guess+1
    elif (grade == "h"):
        n = int(n/guess)
        guess = guess+1

print("I guessed in "+ str(guess) + "steps")