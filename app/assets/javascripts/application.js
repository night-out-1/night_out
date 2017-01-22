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

var longitude = null;
var latitude = null;
var on_events = true;

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
 	console.log("Mr. Sulu, set coordinates for " + longitude + " and " + latitude + ".");
 	console.log("Aye, aye, sir.");
}

function showError(error) {
	console.log("Dammit, Jim, I'm a function, not a gps!");
	console.log("Bones, you could have just told me geolocation was turned off.")
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
		console.log("Captain, nearby ids has been set.");
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





