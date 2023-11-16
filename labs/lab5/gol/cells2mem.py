def chunkstring(string, length):
    return (string[0+i:length+i] for i in range(0, len(string), length))

with open("320x240.cells", 'r') as fileIn, open("data.txt", 'w') as fileOut:
    for line in fileIn:
        print(line, end='')
        line = line.replace('.','00')
        line = line.replace('O','10')
        words = chunkstring(line, 8)
        for word in words:
            fileOut.write(word[::-1] + '\n')