var campus_map = L.map('map', {
                                 center: [37.95451, -91.77386],
                                 zoom: 17,
                                 maxZoom: 25,
                                 minZoom: 15,
                                 maxBounds: [[37.96656, -91.79899],[37.91651, -91.72917]]
                              });

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery   <a href="http://cloudmade.com">CloudMade</a>',
    subdomain: ['a','b','c'],
}).addTo(campus_map);


var mapData = [];
var building = {};
var phpFile = "php/dbHandler.php";

// lazier way to do ajax get
// the ajax will return a string, which is useless to us so eval just evaluates what the hell the string actually is (i.e. it makes an object)
$.get(phpFile,
    { function: "getAllBuildings" }, function (php_results) {
        var buildings = eval(php_results)
        buildings.forEach(function (feature) {
            building.name = feature.name;
            console.log("feature.name", feature.name);
            $.get(phpFile,
              { function: "getBuildingCoords", buildingName: feature.name }, function (latLng) {
                  var latlng = eval(latLng);
                  building.latlng = latlng;
                  console.log("building ", building);
                  var indoorLayer = new L.Indoor(building, {
                      getLevel: function (data) {
                          return 0;
                      }

                  });


              });
        })
        //mapData.push(building);

        console.log("try ", building);


    });

//console.log(mapData);


mapData.forEach(function (data) {
    console.log("result: ", data);
})
/*
$.getJSON(mapData, function (data) {
    
    var indoorLayer = new L.Indoor(geoJSON, {
        getLevel: function (feature) {
            if (feature.properties.relations.length === 0)
                return null;

            return feature.properties.relations[0].reltags.level;
        },
        onEachFeature: function (feature, layer) {
            layer.bindPopup(JSON.stringify(feature.properties, null, 4));
        },
        style: function (feature) {
            var fill = 'white';

            if (feature.properties.tags.buildingpart === 'corridor') {
                fill = '#169EC6';
            } else if (feature.properties.tags.buildingpart === 'verticalpassage') {
                fill = '#0A485B';
            }

            return {
                fillColor: fill,
                weight: 1,
                color: '#666',
                fillOpacity: 1
            };
        }
    });

    indoorLayer.setLevel("0");

    indoorLayer.addTo(map);

    var levelControl = new L.Control.Level({
        level: "0",
        levels: indoorLayer.getLevels()
    });

    // Connect the level control to the indoor layer
    levelControl.addEventListener("levelchange", indoorLayer.setLevel, indoorLayer);

    levelControl.addTo(map);
    

    console.log("try ", data);
});


*/



















// Initialise the FeatureGroup to store editable layers
var drawnItems = new L.FeatureGroup();
campus_map.addLayer(drawnItems)

// Initialise the draw control and pass it the FeatureGroup of editable layers
var drawControl = new L.Control.Draw({
    draw: {
        circle: false
    },
    edit: {
        featureGroup: drawnItems
    }
});
campus_map.addControl(drawControl);

campus_map.on('draw:created', function (e) {
        var popup = L.popup();
        var type = e.layerType,
                layer = e.layer;
        drawnItems.addLayer(layer);
        var content = "";
        layer._latlngs.forEach(function(value){
                content = content + value['lat']+' , ' + value['lng'] + '<br>';
        });
   /*
        var update = confirm("Already Know the Room Number/name?");
                if(update){
                        layer.roomName = prompt("Name",'Room #');
                }
               */ 
        popup.setContent(content+'<br>')

        layer.bindPopup(popup).openPopup();

        layer.on('click',function(){
                var popup = L.popup();
                var content = "";
                layer._latlngs.forEach(function(value){
                        content = content + value['lat']+' , ' + value['lng'] + '<br>';
                });/*
                var update = confirm("Update the Room Number/name?");
                        if(update){
                                layer.roomName = prompt("Name",'Room #');
                        }*/
                popup.setContent(content+'<br>')

                layer.bindPopup(popup).openPopup();
        });
});


/*
var temp = 'css/images/Capture.PNG', imageBounds = [[37.953699, -91.77432], [37.953398, -91.77390]]; // Math Building G

var temp_1 = L.imageOverlay(temp, imageBounds);

temp_1.addTo(campus_map);

temp_1.setOpacity(.5);
*/

L.control.mousePosition().addTo(campus_map);