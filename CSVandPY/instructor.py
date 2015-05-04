##Jacob Curtis
##4-23-15
##Creates the csv that will populate the instructor table for
##the database for MinerMap


def getInstructorInfo():
    first = raw_input("First name: ")
    last = raw_input("Last Name: ")
    dept = raw_input("Department: ")
    office = raw_input("Office: ")
    email = raw_input("Email: ")
    phoneNum = raw_input("Phone Number: ")

    instructorInfo = []
    instructorInfo.append([first, last, dept, office, email, phoneNum])


    return instructorInfo


def updateFile(fileName,writeList):
    '''file must end on a new line'''
    f = open(fileName,'a+')


    for element in writeList:
        element = str(element)[1:-1]
        element = element.replace("'", '"')
        f.write(element)
        f.write("\n")

        

    f.close()
    return



    
def formatFile(fileName):
    '''Replaces single quotes with double quotes and removes whitespace'''
    
    f = open(fileName,'r')
    allText = f.read()
    f.close()

##    removes python's default single quote with double quotes
    allText = allText.replace("'", '"')


    
    f = open(fileName,'w')
    f.write(allText)
    f.close()
    
    print "file saved as: ", fileName
    


def main():

    fileName = raw_input("Instructor file name: ")
    
    while(True):
        
        instructorInfo = getInstructorInfo()
        updateFile(fileName, instructorInfo)

        again = raw_input("Exit <y>: ")
        if(again == 'y' ):
            break
    
        

main()
