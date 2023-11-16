with open("p30gun2.cells", 'r') as fileIn, open("mirror.txt", 'w') as fileOut:
    for line in fileIn:
        fileOut.write(line[::-1])