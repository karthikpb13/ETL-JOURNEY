n=int(input("Enter total number of rows in left triangle:  "))
for i in range(n):
    for j in range(i):
            print(" ", end='')
    for j in range(n-i):
        print("*", end='')
    
    print()

## increasing triangle of spaces
## decreasing triangle of stars

# Output
# Enter total number of rows in left triangle:  5
# *****
#  ****
#   ***
#    **
#     *