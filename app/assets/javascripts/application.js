// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

$(document).ready(function(){
    $('.jumbotron').hide();
    $('.jumbotron').fadeIn(6000);


    $(function() {
    $(window).scroll( function(){
    
       
        $('.fadeIn').each( function(i){
            
            var bottom_of_object = $(this).position().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
           
            bottom_of_window = bottom_of_window + 200;  
          
            if( bottom_of_window > bottom_of_object ){
                
                $(this).animate({'opacity':'1'},4000);
                    
            }
        }); 
    
    });
});

});


window.onload = getLocation

var longitude = "";
var latitude = "";
var latitude_min = "";
var latitude_max = "";

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
	latitude = position.coords.latitude
	longitude = position.coords.longitude
	latitude_min = latitude - 7;
	latitude_max = latitude + 7;
 	console.log(longitude, latitude);
 	// var test = document.createElement("DIV")
 	// var text = document.createTextNode(events);
 	// test.appendChild(text)
 	// var event_container = document.getElementsByClassName("event-container")[0]
 	// event_container.appendChild(test)



	// window.open("localhost:3000//controller/index?latitude_min="+latitude_min+"&latitude_max="+latitude_max"_self");

	// console.log(longitude, latitude);
	// console.log("antes")
	// showEvents();
	// console.log("despues");
	// console.log(latitude_min);

}

function showError(error) {
	var x = document.getElementById("demo");
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred."
            break;
    }
}

function getLatLong(){
	var nearby_ids = [];
	for (var i=0; i<array.length; i++){
		var a = array[i][1] - latitude;
		var b = array[i][2] - longitude;
		var c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));
		if (c < .145){
			nearby_ids.push(array[i][0]);
		};
	};
	console.log(nearby_ids);
	for (var i=0; i<nearby_ids.length; i++){
		document.getElementById(nearby_ids[i].toString()).classList.remove("hidden");
		document.getElementById(nearby_ids[i].toString()).style.display= "block";
	};

	// console.log("yo");
	// console.log(array);
	// console.log(array[2])
	// console.log(array[0][1])
	// console.log(Math.pow(array[2][0], 2))
	// console.log(nearby_ids);
}
// function showEvents(){
// 	for (i=0; i<2; i++){
// 		document.getElementsByClassName("event-card")[i].style.display= "block";
// 		console.log("before");
// 	};
// 	console.log("after");
// }

// function replaceAll(str, find, replace) {
//   return str.replace(new RegExp(find, 'g'), replace);
// }




