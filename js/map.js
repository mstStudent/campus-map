// Declare leaflet map object and place it in the dom with the id of map
var campus_map = L.map('map', {
                                 center: [37.95451, -91.77386], // rough center of campus
                                 zoom: 17, // start zoom level
                                 maxZoom: 25,
                                 minZoom: 15,
                                 maxBounds: [[37.96656, -91.79899],[37.91651, -91.72917]] // Keep user in Rolla
                              });
// Pull imagery tiles from OSM
L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery   <a href="http://cloudmade.com">CloudMade</a>',
    subdomain: ['a','b','c'],
}).addTo(campus_map);

// php file location
var phpFile = "php/dbHandler.php";

// lazier way to do ajax get
// the ajax will return a string, which is useless to us so eval just evaluates what the hell the string actually is (i.e. it makes an object)
$.get(phpFile, { function: "getBuildingCoords" }, function (php_results) {
    var results = eval(php_results); // parse string results into actual results
    var tempList = [];
    results.forEach(function (res) {
        $.merge(tempList, res['features']); // merge the features into on array ( for now )
    });
    var buildings = {"features": tempList};
    console.log("buildings: ", buildings);
    // defind indoor object and how each polygon created should act.
    var indoorLayer = new L.Indoor(buildings, {
        getLevel: function (feature) {
        return feature.properties.level;
        },
        onEachFeature: function (feature, layer) {
            $.get(phpFile, { function: "getRoomEvents", roomID: feature.id }, function (events) {
                var results = eval(events);
                var popupText = '';
                var table = '';
                results.forEach(function (event) {
                    $.each(event, function (eventAtt) {
                        table += eventAtt + ": " + event[eventAtt]+'<br/>'
                    })
                })
                if (table == '') {
                    table = '<p>This room is empty this semester.</p>'
                }
                layer.bindPopup(table);

            })    
         },
        style: function (feature) {
           var fill = feature.properties.color;
           return {
                  fillColor: fill,
                  weight: 1,
                   color: '#666',
                   fillOpacity: 1
           };
         },
         getRoomName: function (feature) {
                return [feature.id, bname];
         }
     });

     indoorLayer.setLevel("0");

     indoorLayer.addTo(campus_map);
    // create object that lets us change floor levels
      var levelControl = new L.Control.Level({
          level: 0,
          levels: [0,1,2,3]
       });

       // Connect the level control to the indoor layer
       levelControl.addEventListener("levelchange", indoorLayer.setLevel, indoorLayer);

       levelControl.addTo(campus_map);

});


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
// Dev tool to help insert data faster
campus_map.on('draw:created', function (e) {
        var popup = L.popup();
        var type = e.layerType,
                layer = e.layer;
        drawnItems.addLayer(layer);
        var content = "";
        layer._latlngs.forEach(function(value){
                content = content + value['lat']+' , ' + value['lng'] + '<br>';
        });
        layer.bindPopup(popup).openPopup();

        layer.on('click',function(){
                var popup = L.popup();
                var content = "";
                layer._latlngs.forEach(function(value){
                        content = content + value['lat']+' , ' + value['lng'] + '<br>';
                });
                popup.setContent(content+'<br>')

                layer.bindPopup(popup).openPopup();
        });
});


// Uncomment block to insert a png overlay.

/*

var temp = 'css/images/Capture.PNG', imageBounds = [[37.953699, -91.77432], [37.953398, -91.77390]]; // Math Building G

var temp = 'css/images/Capture.PNG', imageBounds = [[37.95609, -91.77461], [37.95577, -91.77392]]; // cs Building G


var temp_1 = L.imageOverlay(temp, imageBounds);

temp_1.addTo(campus_map);

temp_1.setOpacity(.5);
*/

// Just show the lat / lng of mouse 
L.control.mousePosition().addTo(campus_map);
