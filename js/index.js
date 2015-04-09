$("#addRoom").click(function(){
  addRoom();
});

$("#addBuilding").click(function(){
  addBuilding();
});

function addRoom(){
  var bName = $('#buildingName_forRooms').val();
  var floor = $('#floorSelect').val();
  console.log('bName: ', bName);
  console.log('floor: ', floor);
 
  $.each(drawnItems._layers ,function(index,room){
      if(room.roomName){
        console.log('Room Name: ', room.roomName);
      }
      else{
        console.log('Room Name is needed');
      }
      console.log('room: ', room._latlngs);
  })

  

}

function addBuilding(){
  var bName = $('#buildingName').val();
  var numFloors = $('#numFloorsSelect').val();
  var mainFloor = $('#mainFloorSelect').val();

  console.log('bName: ', bName);
  console.log('numFloors: ', numFloors);
  console.log('defFloor: ', mainFloor);

  var request = new XMLHttpRequest();

  $.ajax({
    url: "/php/temp_add_building.php",
    type: "POST",
    data: ({bname: bName, fCount: numFloors, defFloor: mainFloor}),
    dataType: 'json',
    success: function(test){
	console.log("YES: ", test)
    }
  });

}
