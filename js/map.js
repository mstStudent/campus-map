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
                content = content + value['lat']+' , ' + value['lng'] + '<br><br>';
        });
        var update = confirm("Already Know the Room Number/name?");
                if(update){
                        layer.roomName = prompt("Name",'Room #');
                }
        popup.setContent(String(layer.roomName)+'<br>'+content)

        layer.bindPopup(popup).openPopup();

        layer.on('click',function(){
                var popup = L.popup();
                var content = "";
                layer._latlngs.forEach(function(value){
                        content = content + value['lat']+' , ' + value['lng'] + '<br><br>';
                });
                var update = confirm("Update the Room Number/name?");
                        if(update){
                                layer.roomName = prompt("Name",'Room #');
                        }
                popup.setContent(String(layer.roomName)+'<br>'+content)

                layer.bindPopup(popup).openPopup();
        });
});

L.control.mousePosition().addTo(campus_map);

