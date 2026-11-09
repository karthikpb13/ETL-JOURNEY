n=int(input("Enter total number of rows in decreasing triangle:  "))
for i in range(n):
    for j in range(n-i):
        print("*", end='')
    print()  

# output
# Enter total number of rows in decreasing triangle:  5
# *****
# ****
# ***
# **
# *