
var map;
var geocoder;
var infoWindow;
var markison;
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : -8.34551115,
			lng : -35.23796773
		},
		zoom : 8
	});

	infoWindow = new google.maps.InfoWindow();
	geocoder = new google.maps.Geocoder();

	/* buttonLocalizacao.addEventListener("click", function() {

		;*/
    
    var centerControlDiv = document.createElement('div');
    var centerControl = new CenterControl(centerControlDiv, map);

    centerControlDiv.index = 1;
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(centerControlDiv);
  
	google.maps.event.addListener(map, 'click', function(event) {

		if (markison != null) {
			markison.setMap(null)
			markison = null
		}
		markison = new google.maps.Marker({
			map : map,
			draggable : true,
			position : (event.latLng)
		})

		markison.addListener('click', function() {
			infoWindow.open(map, this);
		});

		markison.addListener('dblclick', function() {
			markison.setMap(null)
			markison = null
		});

		geocoder.geocode({
			'latLng' : markison.getPosition()
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK)
				if (results[0]){
					alert(results[0].address_components[2].short_name);
					if(results[0].address_components[2].short_name == "PE"){
						infoWindow.setContent(results[0].formatted_address);
						infoWindow.open(map, markison);
						} else {
							infoWindow.setContent("Dados não disponíveis em :"+results[0].formatted_address);
							infoWindow.open(map, markison);
						}
				}	
		})

		markison.addListener('dragend', function() {

			geocoder.geocode({
				'latLng' : markison.getPosition()
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[0]) {
						for(i = 0; results[0].address_components.length; i++){
							
						}
						alert(results[0].address_components[5].short_name);
						if(results[0].address_components[5].short_name == "PE"){
						infoWindow.setContent(results[0].formatted_address);
						infoWindow.open(map, markison);
						} else {
							infoWindow.setContent("Dados não disponíveis em :"+results[0].formatted_address);
							infoWindow.open(map, markison);
						}
					}
				}
			});
		});

	});

};

function handleLocationError(browserHasGeolocation, infoWindowLocalizacao, pos) {
	infoWindowLocalizacao.setPosition(pos);
	infoWindowLocalizacao
			.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
					: 'Error: Your browser doesn\'t support geolocation.');
	infoWindowLocalizacao.open(map);
}


function CenterControl(controlDiv, map) {

    // Set CSS for the control border.
    var controlUI = document.createElement('div');
    controlUI.style.backgroundColor = '#fff';
    controlUI.style.border = '2px solid #fff';
    controlUI.style.borderRadius = '3px';
    controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
    controlUI.style.cursor = 'pointer';
    controlUI.style.marginBottom = '22px';
    controlUI.style.textAlign = 'center';
    controlUI.title = 'Click to recenter the map';
    controlDiv.appendChild(controlUI);
    // Set CSS for the control interior.
    var controlText = document.createElement('div');
    controlText.style.color = 'rgb(25,25,25)';
    controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
    controlText.style.fontSize = '16px';
    controlText.style.lineHeight = '38px';
    controlText.style.paddingLeft = '5px';
    controlText.style.paddingRight = '5px';
    controlText.innerHTML = 'Center Map';
    controlUI.appendChild(controlText);

    // Setup the click event listeners: simply set the map to Chicago.
    controlUI.addEventListener('click', function() {
        
    	var infoWindowLocalizacao = new google.maps.InfoWindow;
        var geocoder = new google.maps.Geocoder();
		// Try HTML5 geolocation.
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var pos = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				};
                
                geocoder.geocode({"latLng":pos}, function(results, status){
                    if(status == google.maps.GeocoderStatus.OK){
                        if(results[0] != null){
                        	if(results[0].address_components[5].short_name == "PE"){
                        		infoWindowLocalizacao.setContent("<h3>Sua Localização<br></h3>" + results[0].formatted_address);
                        	} else { 
                        		infoWindowLocalizacao.setContent("<h3>Os dados ainda não estão disponíveis em seu Estado"+
                        				results[0].address_components[5].short_name+"<br></h3>" + results[0].formatted_address);
                        	}
                        	
                        	
                        }
                    }

                });
				infoWindowLocalizacao.setPosition(pos);
				infoWindowLocalizacao.open(map);
				map.setCenter(pos);
			}, function() {
				handleLocationError(true, infoWindowLocalizacao, map
						.getCenter());
			});
		} else {
			// Browser doesn't support Geolocation
			handleLocationError(false, infoWindowLocalizacao, map.getCenter());
		}

	//})
    });

  }
