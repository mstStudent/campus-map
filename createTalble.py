##Jacob Curtis
##4-9-15
##creates a csv that can be used to populate the coordinates and room
##table in the database for MinerMap

import time

def getRoomInfo():
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

    buildingID = raw_input("buildingID: ")
    roomID = raw_input("roomID: ")
    
    numSeats = raw_input("how many seats? ")
    floorNum = raw_input("what floor? ")
    

    latLng = []
    empty = False

##    allows the user to copy in coordinates seperated by a new line

    print "enter lat, lng: "
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

    roomInfo.append([roomID, roomID, floorNum, numSeats, leafID])

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
        roomCoordList , roomInfoList = getRoomInfo()

        updateFile(coordFile, roomCoordList)
        updateFile(roomFile, roomInfoList)

        goAgain = raw_input("add another Room? ('n' or defaults yes): ")

        if (goAgain == 'n'):
            break

    formatFile(coordFile)
    formatFile(roomFile)
    



main()
