n=int(input("Enter total number of rows in in right triangle:  "))
for i in range(n):
    for j in range(n-i-1):
        print(" ", end='')
    for j in range(i+1):
        print("*", end='')
    print()

## Decreasing triangle of spaces
## Increasing triangle of stars

# Output
# Enter total number of rows in in right triangle:  5
#     *
#    **
#   ***
#  ****
# *****