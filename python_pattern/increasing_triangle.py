n=int(input("Enter total number of rows in increasing triangle:  "))
for i in range(n):
    for j in range(i+1):
        print("*", end='')
    print()

# Output
# Enter total number of rows in increasing triangle:  5
# *
# **
# ***
# ****
# *****