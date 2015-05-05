var phpFile = "php/dbHandler.php";

$.get(phpFile, { function: "getAllBuildings" }, function (php_results) {
    var buildings = eval(php_results)
    buildings.forEach(function (feature) {
        $("#building_search select")
            .append($("<option></option>")
            .attr("value", feature.name)
            .text(feature.name));
        //console.log("feature.name ", feature.name);
    })
})

$("#building_search").change(function () {
    $.get(phpFile, { function: "getRoomIDs", buildingName: $("#building_search option:selected").text() }, function (php_results) {
        var buildings = eval(php_results)
        $("#room_search select").empty();
        buildings.forEach(function (feature) {
            $("#room_search select")
                .append($("<option></option>")
                .attr("value", feature.ID)
                .text(feature.ID));
            //console.log("feature.ID ", feature.ID);
        })
    })
})

$("#startSearch").click(function () {
    console.log($("#room_search option:selected").text());
    //console.log($("#focusedInput").val());

    if ($("#focusedInput").val() != "") {
        console.log($("#focusedInput").val());
        $.get(phpFile, { function: "getNamedEvents", eventName: $("#focusedInput").val() }, function (php_results) {
            var events = eval(php_results)
            $("#dataIsHere").empty();
            events.forEach(function (feature) {
                //window.alert('halp');
                console.log($("#focusedInput").val());
                $("#dataIsHere").append($("<p></p>")
                .text(feature.ID + ' ' + feature.endDate + ' ' + feature.endTime + ' ' + feature.instructor + ' ' + feature.name + ' ' + feature.roomID + ' Section: ' + feature.section));
                //window.alert("FISHYYYYY!!! WHY ARE YOU SLEEPING!")
            })
        })

    }
    else {
        $.get(phpFile, { function: "getRoomEvents", roomID: $("#room_search option:selected").text() }, function (php_results) {
            var result = eval(php_results)
            $("#dataIsHere").empty();
            result.forEach(function (feature) {
                //feature.forEach
                $("#dataIsHere").append($("<p></p>")
                 .text(feature.ID + ' ' + feature.endDate + ' ' + feature.endTime + ' ' + feature.instructor + ' ' + feature.name + ' ' + feature.roomID + ' ' + feature.section));
                //.ID + ' ' feature.endDate + ' ' + feature.endTime + ' ' + feature.instructor + ' ' + feature.name + ' ' feature.name + ' ' + feature.roomID + ' ' feature.section));
            })
        })

    }
})