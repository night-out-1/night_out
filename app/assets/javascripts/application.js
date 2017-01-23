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
    $('.jumbotron').fadeIn(5000);

    $('.li').hover(function() {
    	$(this).slideToggle(1000);

    });


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

//these variables are set to determine when certain functions will run. 
//they are changed both in html script tags and in this JS file. bz
var longitude = null;
var latitude = null;
var enabled = false;
var zip_events = false;

//this function finds the location of the users device and calls showPosition and showError. bz
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else { 
        console.log("Geolocation is not supported by this browser.  This console log is coming from the getLocation function");
    }
}

//this function sets latitude and longitude to the latitude and longitude of the user's device. 
//console logging for presentation purposes. bz
function showPosition(position) {
	latitude = position.coords.latitude
	longitude = position.coords.longitude
 	console.log("Mr. Sulu, set coordinates for " + longitude + " and " + latitude + ".");
 	console.log("Aye, aye, sir.");
}

//this function will occur when location services are disabled on the device. 
//console log for clarity and also shows zip_events since geolocated events will not show. bz
function showError(error) {
	console.log("Dammit, Jim, I'm a doctor, not a gps!");
	console.log("Bones, you could have just told me geolocation was disabled.")
	if (enabled==true){
		console.log("Chekov, enable the search bar.");
		console.log("Sir, you vill get an error.");
		console.log("Does it effect functionality?");
		console.log("No, sir.  But it could be fixed.");
		console.log("We'll cross that bridge when it comes. Enable the search bar.");
		console.log("Aye, aye,  captain.");
		document.getElementById("zip_events").classList.remove("hidden");
	};
}

//this function is called on the events page.
//the if statement will run when the geolocation has succeeded (latitude = something). 
//it finds the distance between the device (geolocated) and the event (saved in database) using the pythagorean theorem. 
//please note that this method, though effective, due to the nature of longitude, is imperfect.
//it then checks if the distance is less than .145, which for latitude is roughly ten miles (again, imperfect).
//if the distance is less than .145, the id of the event is pushed into an array.
//this array is then used to choose which event cards are shown on the event page by removing the class for display: hidden.
//because this function is called whether or not the search bar is enabled, the else statement will run if it is not.
//the else statement will show events based on zip code by removing their class for display:hidden.
//the if enabled=true is present to prevent JS errors.
//enabled is automatically set to false and is changed to true when the search bar is enabled.
//please note that there is additional logic for this function's functions in the events#index view and the events controller. -bz
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
		console.log("Spock, have the geolocated events been found?");
		console.log("Affirmative, captian.");
		for (var i=0; i<nearby_ids.length; i++){
			document.getElementById(nearby_ids[i].toString()).classList.remove("hidden");
			document.getElementById(nearby_ids[i].toString()).style.display= "block";
		};
	}
	else{
		console.log("Uhura, what seems to be the problem?");
		console.log("Captain, there seems to be a boolean missing.");
		console.log("Make sure it doesn't cause any UI issues.");
		console.log("Understood. Scotty, there will be an error if the search bar is used with geolocation. But will the correct events show?");
		console.log("Aye, lass. Although this conversation will also show without an error when geolocation and the search bar are both disabled. There's enough logic in the events view to make it work. She'll show correctly. ");
		document.getElementById("zip_events").classList.remove("hidden");
	};

}





