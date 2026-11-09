n=int(input("Enter total number of rows in hill triangle:  "))
for i in range(n):
    for j in range(n-i):
        print(" ", end='')
    for j in range(i+1):
        print("*", end='')
    for j in range(i):  
        print("*", end='')
    print()


## increasing triangle of spaces
## decreasing triangle of stars
## decreasing triangle of spaces

# output
# Enter total number of rows in hill triangle:  5
#      *
#     ***
#    *****
#   *******
#  *********