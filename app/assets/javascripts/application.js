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

// if you want to run the geolocator, un-commentout the line below and refresh the page and the console will show you the coordinates
window.onload = getLocation

var longitude = null;
var latitude = null;
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
	// var x = document.getElementById("demo");
	latitude = position.coords.latitude
	longitude = position.coords.longitude
	latitude_min = latitude - 7;
	latitude_max = latitude + 7;
 	console.log(longitude, latitude)
}

function showError(error) {
	console.log("location services off");
	document.getElementById("zip_events").classList.remove("hidden");
}

function getLatLong(){
	if (latitude != null){
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
	}
	else{
		console.log("location services off");
		document.getElementById("zip_events").classList.remove("hidden");
	};

}





