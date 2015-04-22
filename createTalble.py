##Jacob Curtis
##4-9-15
##creates a csv that can be used to populate the coordinates and room
##table in the database for MinerMap

##
##readme:
##
##run program:
##    coordinates file -> the csv file containing the room coordinates (roomCoord.csv)
##    room file -> the csv file containing the room info (roomInfo.csv)
##
##    next three are only asked once per floor:
##        building ID -> the id of the building stored in the database
##        building's Abbrevation -> the abbrevation of the building used in the database
##        floor -> the floor that the rooms are on
##    room Name -> the rooms name/number (not unique)
##    
##    enter: lat,lng -> lat and lng coordinates for each point:
##        must be seperated by a ','
##        each pair must be seperated by a new line
##
##    add another room to this floor? -> <n> if you want to change floor or building
##
##    Add another room?:
##        <enter> to add a room to another building or floor
##        <n> to exit program and save
##        
##importing into database:
##    run xampp:
##        launch mySQL admin:
##            insert the building if a new building is worked on:
##            import into rooms:
##                select the room info file (roomInfo.csv)
##                check 'Do not abort on INSERT error'
##                click go
##            import into coordinates:
##                select the coordinate file (roomCoord.csv)
##                check 'Do not abort on INSERT error'
##                click go


def getRoomInfo(buildingID,buildingAbv,floorNum):
    '''Prompts user for room info
        and returns the room's info and coordinate list'''

    roomCoord = []
    roomInfo = []
##
##    roomFlag = raw_input("roomFlag: ")
##    outdoorFlag = raw_input("outdoorFlag: ")
##    leafID = raw_input("leafID: ")

##    values set to default 
    roomFlag = '1'
    outdoorFlag = '0'
    leafID = '0'
    numSeats = '0'

##    temp removed
##    buildingID = raw_input("buildingID: ")
##    buildingAbv = raw_input("building abbreviation: ")
##    floorNum = raw_input("what floor? ")
##    numSeats = raw_input("how many seats? ")

    roomName = raw_input("Room Name: ")
    roomID = buildingAbv + roomName
    
    
    

    latLng = []
    empty = False

##    allows the user to copy in coordinates seperated by a new line

    print "enter: lat, lng: "
    print "end by enter an empty line"
    while(empty == False):
        temp = raw_input()
        if (temp == ''):
            empty = True
        else:
            lat,lng = temp.split(',')
            latLng.append(lat.strip(' '))
            latLng.append(lng.strip(' '))
            
##    creates the coordinate table

    pointOrder = 0
    for i in range(len(latLng))[::2]:
        roomCoord.append([roomFlag,outdoorFlag,buildingID,roomID,latLng[i],latLng[i+1],str(pointOrder)])
        pointOrder += 1

##    creates the room info table

    roomInfo.append([roomID, roomName, floorNum, numSeats, leafID])

    return roomCoord , roomInfo
    
    
def formatFile(fileName):
    '''Replaces single quotes with double quotes and removes whitespace'''
    
    f = open(fileName,'r')
    allText = f.read()
    f.close()

##    removes python's default single quote with double quotes
##    and removes white space
    allText = allText.replace("'", '"')
    allText = allText.replace(' ', '')


    
    f = open(fileName,'w')
    f.write(allText)
    f.close()
    
    print "file saved as: ", fileName
    

def updateFile(fileName,writeList):
    '''file must end on a new line'''
    f = open(fileName,'a+')


    for i in writeList:
        f.write(str(i)[1:-1])
        f.write("\n")

        

    f.close()
    return

def main():

    coordFile = raw_input('coordinates file: ')
    roomFile = raw_input('room file: ')

    while(True):

        buildingID = raw_input("Building ID: ")
        buildingAbv = raw_input("Building's Abbrevation: ")
        floor = raw_input("Floor: ")
        

        while(True):
            roomCoordList , roomInfoList = getRoomInfo(buildingID,buildingAbv,floor)

            updateFile(coordFile, roomCoordList)
            updateFile(roomFile, roomInfoList)

            goAgain = raw_input("add another room to this floor? ('n' or defaults yes): ")

            if (goAgain == 'n'):
                break

        goAgain = raw_input("Add another room? ('n' or defaults yes): ")
        if(goAgain == 'n'):
            break

    formatFile(coordFile)
    formatFile(roomFile)
    



main()
