var phpFile = "php/dbHandler.php";

$.get(phpFile, { function: "getAllBuildings" }, function (php_results) {
    var buildings = eval(php_results)
    buildings.forEach(function (feature) {
        var select = $("#building_search");
        console.log("feature.name ", feature.name);
    })
})
