##Jacob Curtis
##4-9-15
##creates a csv that can be used to populate the coordinates
##table in the database for MinerMap

import time

def getRoomInfo():

    roomCoord = []
    roomInfo = []
##
##    roomFlag = raw_input("roomFlag: ")
##    outdoorFlag = raw_input("outdoorFlag: ")
    roomFlag = '1'
    outdoorFlag = '0'
    leafID = '0'

    numSeats = raw_input("how many seats? ")
    floorNum = raw_input("what floor? ")
    buildingID = raw_input("buildingID: ")
    roomID = raw_input("roomID: ")

    latLng = []
    empty = False

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

    j = 0
    for i in range(len(latLng))[::2]:
        roomCoord.append([roomFlag,outdoorFlag,buildingID,roomID,latLng[i],latLng[i+1],str(j)])
        j+=1
    roomInfo.append([roomID, roomID, floorNum, numSeats, leafID])


##    for element in roomCoord:
##        print element
    return roomCoord , roomInfo
    
    
def formatFile(fileName):
    f = open(fileName,'r')
    allText = f.read()
    f.close()
    
    allText = allText.replace("'", '"')
    allText = allText.replace(' ', '')

    print fileName
    
    f = open(fileName,'w')
    f.write(allText)
    f.close()
    

def updateFile(fileName,writeList):
    '''file must end on a new line'''
    f = open(fileName,'a+')


    for i in writeList:
        f.write(str(i)[1:-1])
        f.write("\n")

        

    f.close()
    return

def main():
##    fileName = 'RollaBuilding.csv'
    coordFile = raw_input('coordinates file: ')
    roomFile = raw_input('room file: ')


    while(True):
        roomCoordList , roomInfoList = getRoomInfo()
##        for i in writeList:
##            print i
##
        updateFile(coordFile, roomCoordList)
        updateFile(roomFile, roomInfoList)

        goAgain = raw_input("add another Room? (y,n): ")

        if (goAgain == 'n'):
            break

    formatFile(coordFile)
    formatFile(roomFile)
    



main()
