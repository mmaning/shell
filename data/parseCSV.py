def parseCSV(csvfile):
    import csv
    with open(csvfile) as csv_file:
        content = csv.reader(csv_file, delimiter=',')
        dates = {}
        errcodes = []
        for row in content:
            errcounts = {}
            date = row[0]
            errorcode = row[1]
            #print("First Column: {}, Sedond Column: {}".format(row[0], row[1]))
            if errorcode not in errcodes:
                errcodes.append(errorcode)
            if date in dates.keys():
                if errorcode in dates[date].keys():
                    dates[date][errorcode] += 1
                else:
                    dates[date][errorcode] = 1 
            else:
                errcounts[errorcode] = 1 
                dates[date]=errcounts
        return dates, errcodes

def genCSV(csvFile, fileData):
    f = open(csvFile, "a")
    f.write(fileData)
    f.close()

if __name__ == "__main__":
    csvfile = "/Users/nima/github/shell/data/sample.csv"
    output = "./output1.csv"
    dates, errcodes = parseCSV(csvfile)
    print(dates, errcodes)

    title = "      "
    for e in errcodes:
        title += "," + e
    title += "\n"
    #genCSV(output, title)
    print(title)

    for date in dates.keys():
        row = date
        for err in errcodes:
            if err not in dates[date].keys():
                err_cnt = ",0"
            else:
                err_cnt = "," + str(dates[date][err])
            row += err_cnt
        #row += "\n"
        #genCSV(output, data)
        print(row)