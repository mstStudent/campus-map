##Jacob Curtis
##4-29-15
##Creates the csv that will populate the events table for
##the database for MinerMap


def getEventInfo():

    eventID = raw_input("Event ID: ")
    eventName = raw_input("Event Name: ")
    startDate = raw_input("Start Date:\n<yyyy-mm-dd>: ")
    endDate = raw_input("End Date:\n<yyyy-mm-dd>: ")
    startTime = raw_input("Start Time <24 hour>:\nhh:mm ")
    startTime = startTime + ":00"
    endTime = raw_input("End Time <24 hour>:\nhh:mm ")
    endTime = endTime + ":00"
    section = raw_input("Section <0 if NA>: ")
    instructor = raw_input("Instructor: ")
    roomID = raw_input("RoomID: ")
    days = raw_input("Day code: ")

    eventInfo = []
    eventInfo.append([eventID,eventName,startDate,endDate,startTime,endTime,section,instructor,roomID,days])


    return eventInfo


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

    fileName = raw_input("Event file name: ")
    
    while(True):
        
        eventInfo = getEventInfo()
        updateFile(fileName, eventInfo)

        again = raw_input("Exit <y>: ")
        if(again == 'y' ):
            break
    
        

main()
