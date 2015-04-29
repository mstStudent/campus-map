##Jacob Curtis
##4-23-15
##Creates the csv that will populate the building table for
##the database for MinerMap


def getBuildingInfo():
    buildingName = raw_input("Building name: ")
    buildingID = raw_input("Building ID: ")
    floorCount = raw_input("How many Floors: ")
    defFloor = raw_input("Default Floor: ")

    buildingInfo = []
    buildingInfo.append([buildingID, buildingName, floorCount, defFloor])
##    print buildingInfo

    return buildingInfo


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
##    and removes white space
    allText = allText.replace("'", '"')
##    allText = allText.replace(' ', '')


    
    f = open(fileName,'w')
    f.write(allText)
    f.close()
    
    print "file saved as: ", fileName
    


def main():

    fileName = raw_input("Building file name: ")
    
    while(True):
        
        buildingInfo = getBuildingInfo()
        updateFile(fileName, buildingInfo)

        again = raw_input("Exit <y>: ")
        if(again == 'y' ):
            break
    
        

main()
