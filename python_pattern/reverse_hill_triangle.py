n=int(input("Enter total number of rows in reverse hill triangle:  "))
for i in range(n):
        for j in range(i):
            print(" ", end='')
        for j in range(n-i):
            print("*", end='')
        for j in range(n-i-1):
            print("*", end='')
        print()

### Increasing triangle of spaces
## decreasing triangle of stars
## decreasing triangle of stars

# Output
# Enter total number of rows in reverse hill triangle:  5
# *********
#  *******
#   *****
#    ***
#     *