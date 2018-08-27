<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="map"></div>
<div id='containerGraficos' style='width: 100%;'></div>
<script>

var style = [
    {
        "featureType": "all",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "saturation": 36
            },
            {
                "color": "#a81010"
            },
            {
                "lightness": 40
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#000000"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#a81010"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#a81010"
            },
            {
                "lightness": 17
            },
            {
                "weight": 1.2
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": 20
            },
            {
                "color": "#383838"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 21
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 17  
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 29
            },
            {
                "weight": 0.2
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 18
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#a81010"
            },
            {
                "lightness": 16
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": 19
            },
            {
                "color": "#404040"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#000000"
            },
            {
                "lightness": 17
            }
        ]
    }
];
var map;
var geocoder;
var infoWindows = [];
var markers = [];
var buttons = [];
var selected = "m";
var municipio;
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : -8.23271878,
			lng : -37.80602193
        },
        mapTypeControl: false,
		zoom: 9,
		styles:style
    });
    
   

	
	geocoder = new google.maps.Geocoder();

     //buttons
  
    var cleanControlDiv = document.createElement('div');
    var cleanControl = new CleanControl(cleanControlDiv, map);
    
    cleanControl.index = 3;
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(cleanControlDiv);
    
    var selectDiv = document.createElement('div');
    var selectDivControl = new selectRM(selectDiv, map);

    selectDivControl.index = 4;
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(selectDiv);

    var localitionControlDiv = document.createElement('div');
    var localitionControl = new LocalitionControl(localitionControlDiv, map);

    localitionControlDiv.index = 2;
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(localitionControlDiv);

	google.maps.event.addListener(map, 'click', function(event) {
		
		var icon = {
			    url: "<%=request.getContextPath()%>/resources/assets/marker.png",
			    scaledSize: new google.maps.Size(70, 90), // scaled size
			    origin: new google.maps.Point(0,0), // origin
			    anchor: new google.maps.Point(35, 80) // anchor
			};
		
		positionMarker = markers.length;
		markers.push(marker = new google.maps.Marker({
			map : map,
			draggable : true,
			position : (event.latLng),
			icon: icon
		}));

        markers[positionMarker]['infoWindow'] = new google.maps.InfoWindow({ maxWidth: 600 });

		markers[positionMarker].addListener('click', function() {
			this['infoWindow'].open(map, this);
		});

		markers[positionMarker].addListener('dblclick', function() {
			this.setMap(null);
			markers[positionMarker] = null
		});

		geocoder.geocode({
			'latLng' : markers[positionMarker].getPosition()
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK){
				if (results[0]) {
					var isAvailable = false;
					var indexState;
				
					for(i = 0; i < results[0].address_components.length; i++){
						if(results[0].address_components[i].types[0] == "administrative_area_level_1"){
								indexState = i;
								if(results[0].address_components[i].short_name == "PE"){
									isAvailable = true;
									break;
								}
							}
					}	
					if(isAvailable){
                        var municipio = "";
                        var filtroMun = "administrative_area_level_2";
					if(selected == "m"){
                        results[0].address_components.forEach(ac => {
                            if(ac.types[0] == filtroMun){
                                municipio = ac.short_name;
                            }

                        });
                        
					} else {

                        results[0].address_components.forEach(ac => {
                            if(ac.types[0] == filtroMun){
                                municipio = ac.short_name;
                                
                            } 

                        });
                        var mesorregiao;
                        var positionMesorregiao;
                        var arrayMesorregiaos= ["Agreste Central","Agreste Meridional","Agreste Setentrional","Mata Norte","Mata Sul","Metropolitana","Sert�o Central","Sert�o De Itaparica","Sert�o Do Araripe","Sert�o Do Moxoto","Sert�o Do Pajeu","Sert�o Do S�o Francisco"]
                        for(i = 0; i < regioes.length; i++) {
                        	for(j = 0; j < regioes[i].length; j++){
                                if(regioes[i][j] == municipio){
                                    positionMesorregiao = i;
                                    break;
                                } 
                            }
                            if(typeof positionMesorregiao !== "undefined"){break;}
                        }
                        mesorregiao = arrayMesorregiaos[positionMesorregiao];
                       
                        
						
                    }
						
						
							
						
						
						if(selected == "m") {
							
							
							$.post("/PP2-DangerousPlace/dadosMunicipio", {'municipio': municipio}, function(result){
					    		console.log(result);
					    	
					    		var color = Chart.helpers.color;
					    		var barChartData = {
					    			labels: ['2014','2015', '2016'],
					    			datasets: [{
					    				label: 'Assassinatos',
					    				backgroundColor: color(window.chartColors.red).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.red,
					    				borderWidth: 1,
					    				data: [
					    					result.mAssassinatos[0].totalAssassinatos,
					    					result.mAssassinatos[1].totalAssassinatos,
					    					0
					    					]
					    			}, {
					    				label: 'Assaltos',
					    				backgroundColor: color(window.chartColors.black).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.black,
					    				borderWidth: 1,
					    				data: [  
					    	                
					    					result.mAssaltos[0].totalAssaltos,
					    					result.mAssaltos[1].totalAssaltos,
					    					result.mAssaltos[2].totalAssaltos,
					    	            ]
					    			}]
					    		};
					    		// InfoWindow's Controls 
					    		var canvas = document.createElement('canvas');
					    		var div = document.getElementById('containerGraficos');
					    		var divWithin = document.createElement("div");
					    		div.appendChild(divWithin);
					    		divWithin.appendChild(canvas);
					            var id = document.getElementsByTagName("canvas");
					            divWithin.setAttribute("id", id.length.toString()+"div");
					    		canvas.setAttribute("id", id.length);
					    		var ctx = document.getElementById(id.length);
					    		
					    		var buttonGerar = document.createElement("BUTTON");
					    		var buttonTextGerar = document.createTextNode("Gerar Relat�rio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioMunicipio('"+result.mAssaltos[0].municipio+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Coment�rios");
					    		
					    		buttonComen.setAttribute("class", "btn btn-danger pull-right");
					    		buttonComen.appendChild(buttonTextComen);
                                

                                divWithin.appendChild(buttonComen);
					    		divWithin.appendChild(buttonGerar);
                               

					    		

					    			window.myBar = new Chart(ctx, {
					    				type: 'bar',
					    				data: barChartData,
					    				options: {
					    					responsive: true,
					    					legend: {
					    						position: 'top',
					    					},
					    					title: {
					    						display: true,
					    						text: 'Estatisticas de '+result.mAssaltos[0].municipio,
					    						fontSize: 17
					    					}
					    				}
					    			
					    			});
					    			
					    				
					    				
                                    markers[positionMarker]['infoWindow'].setContent(divWithin);
                                    markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);


                                        

                                        
							});
					    	
							
							
						} else {
							
							$.post("/PP2-DangerousPlace/dadosRegiao", {'regiao': mesorregiao}, function(result){
					    		console.log(result);
					    	
					    		var color = Chart.helpers.color;
					    		var barChartData = {
					    			labels: ['2014','2015', '2016'],
					    			datasets: [{
					    				label: 'Assassinatos',
					    				backgroundColor: color(window.chartColors.red).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.red,
					    				borderWidth: 1,
					    				data: [
					    					result.rAssassinatos[0].totalAssassinatos,
					    					result.rAssassinatos[1].totalAssassinatos,
					    	            0,
					    	            0,
					    	            0
					    	            ]
					    			}, {
					    				label: 'Assaltos',
					    				backgroundColor: color(window.chartColors.black).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.black,
					    				borderWidth: 1,
					    				data: [  
					    	                
					    					result.rAssaltos[0].totalAssaltos,
					    					result.rAssaltos[1].totalAssaltos,
					    					result.rAssaltos[2].totalAssaltos,
					    	                0,
					    	                0
					    	            ]
					    			}]
					    		};
					    		
                                var canvas = document.createElement('canvas');
					    		var div = document.getElementById('containerGraficos');
					    		var divWithin = document.createElement("div");
					    		div.appendChild(divWithin);
					    		divWithin.appendChild(canvas);
					            var id = document.getElementsByTagName("canvas");
					            divWithin.setAttribute("id", id.length.toString()+"div");
					    		canvas.setAttribute("id", id.length);
					    		var ctx = document.getElementById(id.length);
					    		
					    		var buttonGerar = document.createElement("BUTTON");
					    		var buttonTextGerar = document.createTextNode("Gerar Relat�rio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioRegiao('"+result.rAssaltos[0].regiao+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Coment�rios");
					    		
					    		buttonComen.setAttribute("class", "btn btn-danger pull-right");
					    		buttonComen.appendChild(buttonTextComen);
                                

                                divWithin.appendChild(buttonComen);
					    		divWithin.appendChild(buttonGerar);
                               

					    		

					    			window.myBar = new Chart(ctx, {
					    				type: 'bar',
					    				data: barChartData,
					    				options: {
					    					responsive: true,
					    					legend: {
					    						position: 'top',
					    					},
					    					title: {
					    						display: true,
					    						text: 'Estatisticas de '+result.rAssaltos[0].regiao,
					    						fontSize: 17
					    					}
					    				}
					    			
					    			});
					    				
                                    markers[positionMarker]['infoWindow'].setContent(divWithin);
                                    markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);

					    	});
							
						}
						
					} else {
						markers[positionMarker]['infoWindow'].setContent("Dados n�o dispon�veis em: "+results[0].address_components[indexState].short_name
								+"<br />"+results[0].formatted_address);
						markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);
					}
				}
			}	
		})

		markers[positionMarker].addListener('dragend', function() {

			geocoder.geocode({
				'latLng' : markers[positionMarker].getPosition()
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					if (results[0]) {
						var isAvailable = false;
						var indexState;
						
						for(i = 0; i < results[0].address_components.length; i++){
							if(results[0].address_components[i].types[0] == "administrative_area_level_1" ){
									indexState = i;
									if(results[0].address_components[i].short_name == "PE"){
										isAvailable = true;
										break;
									}
								}
						}	
						if(isAvailable){
                            var municipio = "";
                            var filtroMun = "administrative_area_level_2";
						if(selected == "m"){
                            results[0].address_components.forEach(ac => {
                                if(ac.types[0] == filtroMun){
                                    municipio = ac.short_name;
                                }

                            });
						} else {

                            results[0].address_components.forEach(ac => {
                                if(ac.types[0] == filtroMun){
                                    municipio = ac.short_name;
                                    
                                }

                            });
                            var mesorregiao;
                            var positionMesorregiao;
                            var arrayMesorregiaos= ["Agreste Central","Agreste Meridional","Agreste Setentrional","Mata Norte","Mata Sul","Metropolitana","Sert�o Central","Sert�o De Itaparica","Sert�o Do Araripe","Sert�o Do Moxoto","Sert�o Do Pajeu","Sert�o Do S�o Francisco"]
                            for(i = 0; i < regioes.length; i++) {
                            	for(j = 0; j < regioes[i].length; j++){
                                    if(regioes[i][j] == municipio){
                                        positionMesorregiao = i;
                                        break;
                                    }
                                }
                                if(typeof ositionMesorregiao !== "undefined"){break;}
                            }
                            mesorregiao = arrayMesorregiaos[positionMesorregiao];

                        }
    						
if(selected == "m") {
							
							
							$.post("/PP2-DangerousPlace/dadosMunicipio", {'municipio': municipio}, function(result){
					    		console.log(result);
					    	
					    		var color = Chart.helpers.color;
					    		var barChartData = {
					    			labels: ['2014','2015', '2016', '2017', '2018'],
					    			datasets: [{
					    				label: 'Assassinatos',
					    				backgroundColor: color(window.chartColors.red).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.red,
					    				borderWidth: 1,
					    				data: [
					    					result.mAssassinatos[0].totalAssassinatos,
					    					result.mAssassinatos[1].totalAssassinatos,
					    	            0,
					    	            0,
					    	            0
					    	            ]
					    			}, {
					    				label: 'Assaltos',
					    				backgroundColor: color(window.chartColors.black).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.black,
					    				borderWidth: 1,
					    				data: [  
					    	                
					    					result.mAssaltos[0].totalAssaltos,
					    					result.mAssaltos[1].totalAssaltos,
					    					result.mAssaltos[2].totalAssaltos,
					    	                0,
					    	                0
					    	            ]
					    			},{
					    				label: 'Acidentes',
					    				backgroundColor: color(window.chartColors.green).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.green,
					    				borderWidth: 1,
					    				data: []
					    			}]
					    		};
					    		
					    		var canvas = document.createElement('canvas');
					    		var div = document.getElementById('containerGraficos');
					    		var divWithin = document.createElement("div");
					    		div.appendChild(divWithin);
					    		divWithin.appendChild(canvas);
					            var id = document.getElementsByTagName("canvas");
					            divWithin.setAttribute("id", id.length.toString()+"div");
					    		canvas.setAttribute("id", id.length);
					    		var ctx = document.getElementById(id.length);
					    		
					    		var buttonGerar = document.createElement("BUTTON");
					    		var buttonTextGerar = document.createTextNode("gerar Relar�tio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioMunicipio('"+result.mAssaltos[0].municipio+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Coment�rios");
					    		
					    		buttonComen.setAttribute("class", "btn btn-danger pull-right");
					    		buttonComen.appendChild(buttonTextComen);
                                

                                divWithin.appendChild(buttonComen);
					    		divWithin.appendChild(buttonGerar);
                               

					    		

					    			window.myBar = new Chart(ctx, {
					    				type: 'bar',
					    				data: barChartData,
					    				options: {
					    					responsive: true,
					    					legend: {
					    						position: 'top',
					    					},
					    					title: {
					    						display: true,
					    						text: 'Estatisticas de '+result.mAssaltos[0].municipio,
					    						fontSize: 17
					    					}
					    				}
					    			
					    			});
					    			
					    				
					    				
                                    markers[positionMarker]['infoWindow'].setContent(divWithin);
                                    markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);

					    	});
					    	
							
							
						} else {
							
							$.post("/PP2-DangerousPlace/dadosRegiao", {'regiao': mesorregiao}, function(result){

					    		console.log(result);
					    	
					    		var color = Chart.helpers.color;
					    		var barChartData = {
					    			labels: ['2014','2015', '2016', '2017', '2018'],
					    			datasets: [{
					    				label: 'Assassinatos',
					    				backgroundColor: color(window.chartColors.red).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.red,
					    				borderWidth: 1,
					    				data: [
					    					result.rAssassinatos[0].totalAssassinatos,
					    					result.rAssassinatos[1].totalAssassinatos,
					    	            0,
					    	            0,
					    	            0
					    	            ]
					    			}, {
					    				label: 'Assaltos',
					    				backgroundColor: color(window.chartColors.black).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.black,
					    				borderWidth: 1,
					    				data: [  
					    	                
					    					result.rAssaltos[0].totalAssaltos,
					    					result.rAssaltos[1].totalAssaltos,
					    					result.rAssaltos[2].totalAssaltos,
					    	                0,
					    	                0
					    	            ]
					    			},{
					    				label: 'Acidentes',
					    				backgroundColor: color(window.chartColors.green).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.green,
					    				borderWidth: 1,
					    				data: []
					    			}]
					    		};
					    		
					    		var canvas = document.createElement('canvas');
					    		var div = document.getElementById('containerGraficos');
					    		var divWithin = document.createElement("div");
					    		div.appendChild(divWithin);
					    		divWithin.appendChild(canvas);
					            var id = document.getElementsByTagName("canvas");
					            divWithin.setAttribute("id", id.length.toString()+"div");
					    		canvas.setAttribute("id", id.length);
					    		var ctx = document.getElementById(id.length);
					    		
					    		var buttonGerar = document.createElement("BUTTON");
					    		var buttonTextGerar = document.createTextNode("gerar Relar�tio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioMunicipio('"+result.mAssaltos[0].regiao+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Coment�rios");
					    		
					    		buttonComen.setAttribute("class", "btn btn-danger pull-right");
					    		buttonComen.appendChild(buttonTextComen);
                                

                                divWithin.appendChild(buttonComen);
					    		divWithin.appendChild(buttonGerar);
                               

					    		

					    			window.myBar = new Chart(ctx, {
					    				type: 'bar',
					    				data: barChartData,
					    				options: {
					    					responsive: true,
					    					legend: {
					    						position: 'top',
					    					},
					    					title: {
					    						display: true,
					    						text: 'Estatisticas de '+result.mAssaltos[0].municipio,
					    						fontSize: 17
					    					}
					    				}
					    			
					    			});
					    			
					    				
					    				
                                    markers[positionMarker]['infoWindow'].setContent(divWithin);
                                    markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);

					    	});
							
						}
						} else {
							markers[positionMarker]['infoWindow'].setContent("Dados n�o dispon�veis em: "+results[0].address_components[indexState].short_name
									+"<br />"+results[0].formatted_address);
                                    markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);
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


function LocalitionControl(controlDiv, map) {

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
    controlText.innerHTML = 'Minha Localiza��o';
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
				

				var icon = {
					    url: "<%=request.getContextPath()%>/resources/assets/marker.png",
					    scaledSize: new google.maps.Size(70, 90), // scaled size
					    origin: new google.maps.Point(0,0), // origin
					    anchor: new google.maps.Point(35, 80) // anchor
					};
		positionMarker = markers.length;
		markers.push(marker = new google.maps.Marker({
			map : map,
			draggable : true,
			position : pos,
			icon: icon
		}));

        markers[positionMarker]['infoWindow'] = new google.maps.InfoWindow({ maxWidth: 600 });

		markers[positionMarker].addListener('click', function() {
			this['infoWindow'].open(map, this);
		});

		markers[positionMarker].addListener('dblclick', function() {
			this.setMap(null);
			markers[positionMarker] = null
		});
                geocoder.geocode({"latLng": pos}, function(results, status){
                    if(status == google.maps.GeocoderStatus.OK){
                    	if (results[0]) {
    						var isAvailable = false;
    						var indexState;
    						
    						
    						for(i = 0; i < results[0].address_components.length; i++){
    							if(results[0].address_components[i].types[0] == "administrative_area_level_1"){
    									indexState = i;
    									if(results[0].address_components[i].short_name == "PE"){
    										isAvailable = true;
    										break;
    									}
    								}
    						}	
    						if(isAvailable){
                                var municipio = "";
                                var filtroMun = "administrative_area_level_2";
    						if(selected == "m"){
                                results[0].address_components.forEach(ac => {
                                    if(ac.types[0] == filtroMun){
                                        municipio = ac.short_name;
                                    }
    
                                });
    						} else {

                                results[0].address_components.forEach(ac => {
                                    if(ac.types[0] == filtroMun){
                                        municipio = ac.short_name;
                                        
                                    }
    
                                });
                                var mesorregiao;
                                var positionMesorregiao;
                                var arrayMesorregiaos= ["Agreste Central","Agreste Meridional","Agreste Setentrional","Mata Norte","Mata Sul","Metropolitana","Sert�o Central","Sert�o De Itaparica","Sert�o Do Araripe","Sert�o Do Moxoto","Sert�o Do Pajeu","Sert�o Do S�o Francisco"]
                                for(i = 0; i < regioes.length; i++) {
                                	for(j = 0; j < regioes[i].length; j++){
                                        if(regioes[i][j] == municipio){
                                            positionMesorregiao = i;
                                            break;
                                        } 
                                    }
                                    if(typeof ositionMesorregiao !== "undefined"){break;}
                                }
                                mesorregiao = arrayMesorregiaos[positionMesorregiao];
                                
                            }
    						
    						if(selected == "m") {
    							
    							
    							$.post("/PP2-DangerousPlace/dadosMunicipio", {'municipio': municipio}, function(result){
    					    		console.log(result);
    					    	
    					    		var color = Chart.helpers.color;
    					    		var barChartData = {
    					    			labels: ['2014','2015', '2016'],
    					    			datasets: [{
    					    				label: 'Assassinatos',
    					    				backgroundColor: color(window.chartColors.red).alpha(4.5).rgbString(),
    					    				borderColor: window.chartColors.red,
    					    				borderWidth: 1,
    					    				data: [
    					    					result.mAssassinatos[0].totalAssassinatos,
    					    					result.mAssassinatos[1].totalAssassinatos,
    					    	            0,
    					    	            0,
    					    	            0
    					    	            ]
    					    			}, {
    					    				label: 'Assaltos',
    					    				backgroundColor: color(window.chartColors.black).alpha(4.5).rgbString(),
    					    				borderColor: window.chartColors.black,
    					    				borderWidth: 1,
    					    				data: [  
    					    	                
    					    					result.mAssaltos[0].totalAssaltos,
    					    					result.mAssaltos[1].totalAssaltos,
    					    					result.mAssaltos[2].totalAssaltos,
    					    	                0,
    					    	                0
    					    	            ]
    					    			},{
    					    				label: 'Acidentes',
    					    				backgroundColor: color(window.chartColors.green).alpha(4.5).rgbString(),
    					    				borderColor: window.chartColors.green,
    					    				borderWidth: 1,
    					    				data: []
    					    			}]
    					    		};
    					    		
    					    		var canvas = document.createElement('canvas');
					    		var div = document.getElementById('containerGraficos');
					    		var divWithin = document.createElement("div");
					    		div.appendChild(divWithin);
					    		divWithin.appendChild(canvas);
					            var id = document.getElementsByTagName("canvas");
					            divWithin.setAttribute("id", id.length.toString()+"div");
					    		canvas.setAttribute("id", id.length);
					    		var ctx = document.getElementById(id.length);
					    		
					    		var buttonGerar = document.createElement("BUTTON");
					    		var buttonTextGerar = document.createTextNode("gerar Relar�tio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioMunicipio('"+result.mAssaltos[0].municipio+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Coment�rios");
					    		
					    		buttonComen.setAttribute("class", "btn btn-danger pull-right");
					    		buttonComen.appendChild(buttonTextComen);
                                

                                divWithin.appendChild(buttonComen);
					    		divWithin.appendChild(buttonGerar);
                               

					    		

					    			window.myBar = new Chart(ctx, {
					    				type: 'bar',
					    				data: barChartData,
					    				options: {
					    					responsive: true,
					    					legend: {
					    						position: 'top',
					    					},
					    					title: {
					    						display: true,
					    						text: 'Estatisticas de '+result.mAssaltos[0].municipio,
					    						fontSize: 17
					    					}
					    				}
					    			
					    			});
					    			
					    				
					    				
                                    markers[positionMarker]['infoWindow'].setContent(divWithin);
                                    markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);


    					    	});
    					    	
    							
    							
    						} else {
    							
    							$.post("/PP2-DangerousPlace/dadosRegiao", {'regiao': mesorregiao}, function(result){
    					    		console.log(result);
    					    	
    					    		var color = Chart.helpers.color;
    					    		var barChartData = {
    					    			labels: ['2014','2015', '2016'],
    					    			datasets: [{
    					    				label: 'Assassinatos',
    					    				backgroundColor: color(window.chartColors.red).alpha(4.5).rgbString(),
    					    				borderColor: window.chartColors.red,
    					    				borderWidth: 1,
    					    				data: [
    					    					result.rAssassinatos[0].totalAssassinatos,
    					    					result.rAssassinatos[1].totalAssassinatos,
    					    	            0,
    					    	            0,
    					    	            0
    					    	            ]
    					    			}, {
    					    				label: 'Assaltos',
    					    				backgroundColor: color(window.chartColors.black).alpha(4.5).rgbString(),
    					    				borderColor: window.chartColors.black,
    					    				borderWidth: 1,
    					    				data: [  
    					    	                
    					    					result.rAssaltos[0].totalAssaltos,
    					    					result.rAssaltos[1].totalAssaltos,
    					    					result.rAssaltos[2].totalAssaltos,
    					    	                0,
    					    	                0
    					    	            ]
    					    			},{
    					    				label: 'Acidentes',
    					    				backgroundColor: color(window.chartColors.green).alpha(4.5).rgbString(),
    					    				borderColor: window.chartColors.green,
    					    				borderWidth: 1,
    					    				data: []
    					    			}]
    					    		};
    					    		
    					    		var canvas = document.createElement('canvas');
					    		var div = document.getElementById('containerGraficos');
					    		var divWithin = document.createElement("div");
					    		div.appendChild(divWithin);
					    		divWithin.appendChild(canvas);
					            var id = document.getElementsByTagName("canvas");
					            divWithin.setAttribute("id", id.length.toString()+"div");
					    		canvas.setAttribute("id", id.length);
					    		var ctx = document.getElementById(id.length);
					    		
					    		var buttonGerar = document.createElement("BUTTON");
					    		var buttonTextGerar = document.createTextNode("gerar Relar�tio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioRegiao('"+result.rAssaltos[0].regiao+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Coment�rios");
					    		
					    		buttonComen.setAttribute("class", "btn btn-danger pull-right");
					    		buttonComen.appendChild(buttonTextComen);
                                

                                divWithin.appendChild(buttonComen);
					    		divWithin.appendChild(buttonGerar);
                               

					    		

					    			window.myBar = new Chart(ctx, {
					    				type: 'bar',
					    				data: barChartData,
					    				options: {
					    					responsive: true,
					    					legend: {
					    						position: 'top',
					    					},
					    					title: {
					    						display: true,
					    						text: 'Estatisticas de '+result.mAssaltos[0].municipio,
					    						fontSize: 17
					    					}
					    				}
					    			
					    			});
					    			
					    				
					    				
                                    markers[positionMarker]['infoWindow'].setContent(divWithin);
                                    markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);

    					    	});
    							
    						}
    						} else {
    							markers[positionMarker]['infoWindow'].setContent("Dados n�o dispon�veis em: "+results[0].address_components[indexState].short_name
    									+"<br />"+results[0].formatted_address);
                                        markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);
    						}
    					}
                    }

                });
				
				
				map.setCenter(pos);
			}, function() {
				handleLocationError(true, markers[positionMarker], map
						.getCenter());
			});
		} else {
			// Browser doesn't support Geolocation
			handleLocationError(false, markers[positionMarker], map.getCenter());
		}

    });

  }


function CleanControl(controlDiv, map) {

    // Set CSS for the control border.
    var controlUI = document.createElement('div');
    controlUI.style.backgroundColor = '#fff';
    controlUI.style.border = '2px solid #fff';
    controlUI.style.borderRadius = '3px';
    controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
    controlUI.style.cursor = 'pointer';
    controlUI.style.marginBottom = '40px';
    controlUI.style.top = '50px';
    controlUI.style.left = '600px';
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
    controlText.innerHTML = 'Desfazer Marca��es';
    controlUI.appendChild(controlText);

    
    // Setup the click event listeners: simply set the map to Chicago.
    controlUI.addEventListener('click', function() {
    	
    	markers.forEach(m => {
    		m.setMap(null);
    		m = null
    	});
    	
    });
    
    
  }
  
function selectRM(controlDiv, map) {

    // Set CSS for the control border.
    var controlUI = document.createElement('div');
    controlUI.style.backgroundColor = '#fff';
    controlUI.style.border = '2px solid #fff';
    controlUI.style.borderRadius = '3px';
    controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
    controlUI.style.cursor = 'pointer';
    controlUI.style.marginBottom = '100px';
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
    controlText.innerHTML = '<select id="selectMunicipioOrRegiao"class="selectpicker" onchange="changeSelected()"><option value="m">Munic�pio</option><option value="r">Regi�o</option></select>';
    controlUI.appendChild(controlText);
    }
    
    function changeSelected() {
    	var select = document.getElementById("selectMunicipioOrRegiao");
    	selected = select.options[select.selectedIndex].value;
    }
    
    function gerarRelatorioMunicipio(municipio) {

        $.post("/PP2-DangerousPlace/dadosMunicipio", {'municipio': municipio}, function(result){
        	
    	var columnsAssaltos = [
            {title :  "Ano" , dataKey :  "ano" },
            {title :  "R_Carga" , dataKey :  "roubo_carga" },
            {title :  "R_Lojas" , dataKey :  "roubo_estabelecimento" },
            {title :  "R_Bancos\n" , dataKey :  "roubo_institui��o_financeira" },
            {title :  "R_moto" , dataKey :  "roubo_moto" },
            {title :  "Extors�o" , dataKey :  "roubo_extors�o" }
             
        ]

    	
        var rowsAssaltos = [

            {"ano" :result.mAssaltos[0].ano , "roubo_carga" : result.mAssaltos[0].rouboCarga  ,  "roubo_estabelecimento" : result.mAssaltos[0].rouboEstabelecimento ,"roubo_institui��o_financeira" : result.mAssaltos[0].rouboInstFinanc , "roubo_moto" : result.mAssaltos[0].rouboMotoneta, "roubo_extors�o" : result.mAssaltos[0].rouboExtorsao },
            {"ano" :result.mAssaltos[1].ano ,"roubo_carga" : result.mAssaltos[1].rouboCarga  ,  "roubo_estabelecimento" : result.mAssaltos[1].rouboEstabelecimento ,"roubo_institui��o_financeira" : result.mAssaltos[1].rouboInstFinanc , "roubo_moto" : result.mAssaltos[1].rouboMotoneta, "roubo_extors�o" : result.mAssaltos[1].rouboExtorsao },
            //{"ano" :result.mAssaltos[2].ano , "roubo_carga" : result.mAssaltos[2].rouboCarga  ,  "roubo_estabelecimento" : result.mAssaltos[2].rouboEstabelecimento ,"roubo_institui��o_financeira" : result.mAssaltos[2].rouboInstFinanc , "roubo_moto" : result.mAssaltos[2].rouboMotoneta, "roubo_extors�o" : result.mAssaltos[2].rouboExtorsao }

        ];

    	var columnsAssassinatos = [
    		
            {title :  "Ano" , dataKey :  "ano" },
            {title :  "Qtd_Homicidio" , dataKey :  "qtd_homicidio" },
            {title :  "Qtd_Latrocinio" , dataKey :  "qtd_latrocinio" },
            {title :  "Qtd_Arma branca" , dataKey :  "qtd_arma_branca" },
            {title :  "Qtd_Arma de fogo"  , dataKey :  "qtd_arma_fogo" },
            {title :  "Total assassinatos"  , dataKey :  "total_assassi" }
            
            
            
        ]

        var rowsAssassinatos = [

            {"ano" :result.mAssassinatos[0].ano , "qtd_homicidio" : result.mAssassinatos[0].quantidadeHomicidio  ,  "qtd_latrocinio" : result.mAssassinatos[0].quantidadeLatrocinio ,"qtd_arma_branca" : result.mAssassinatos[0].quantidadeArmabranca , "qtd_arma_fogo" : result.mAssassinatos[0].quantidadeArmafogo, "total_assassi" : result.mAssassinatos[0].totalAssassinatos },
            {"ano" :result.mAssassinatos[1].ano ,"qtd_homicidio" : result.mAssassinatos[1].quantidadeHomicidio  ,  "qtd_latrocinio" : result.mAssassinatos[1].quantidadeLatrocinio ,"qtd_arma_branca" : result.mAssassinatos[1].quantidadeArmabranca, "qtd_arma_fogo" : result.mAssassinatos[1].quantidadeArmafogo, "total_assassi" : result.mAssassinatos[1].totalAssassinatos },
            //{"ano" :result.mAssassinatos[2].ano , "qtd_homicidio" : result.mAssassinatos[2].quantidadeHomicidio  ,  "qtd_latrocinio" : result.mAssassinatos[2].quantidadeLatrocinio ,"qtd_arma_branca" : result.mAssassinatos[2].quantidadeArmabranca, "qtd_arma_fogo" : result.mAssassinatos[2].quantidadeArmafogo, "total_assassi" : result.mAssassinatos[2].totalAssassinatos }

        ];

        // Only pt supported (not mm or in)
        var doc = new jsPDF('p', 'pt');
    	var startingPage = doc.internal.getCurrentPageInfo().pageNumber;
        doc.autoTable(columnsAssaltos, rowsAssaltos,{
            styles: {fillColor: [100, 255, 255]},
            margin: {top: 60},
            avoidPageSplit: true,
            addPageContent: function(data) {
            	doc.text("Dangerous Place \n Munic�pio: "+result.mAssaltos[0].municipio, 40, 30);
            }
        });
        doc.autoTable(columnsAssassinatos, rowsAssassinatos,{
            styles: {fillColor: [100, 255, 255], overflow: 'linebreak'},
            margin: {top: 210},
            addPageContent: function(data) {
            }        
        });
        doc.save('table.pdf');   
    });
}

function gerarRelatorioRegiao(mesorregiao) {

    $.post("/PP2-DangerousPlace/dadosRegiao", {'regiao': mesorregiao}, function(result){
    	var columnsAssaltos = [
            {title :  "Ano" , dataKey :  "ano" },
            {title :  "R_Carga" , dataKey :  "roubo_carga" },
            {title :  "R_Lojas" , dataKey :  "roubo_estabelecimento" },
            {title :  "R_Bancos\n" , dataKey :  "roubo_institui��o_financeira" },
            {title :  "R_moto" , dataKey :  "roubo_moto" },
            {title :  "Extors�o" , dataKey :  "roubo_extors�o" }
             
        ]

    	
        var rowsAssaltos = [

            {"ano" :result.rAssaltos[0].ano , "roubo_carga" : result.rAssaltos[0].rouboCarga  ,  "roubo_estabelecimento" : result.rAssaltos[0].rouboEstabelecimento ,"roubo_institui��o_financeira" : result.rAssaltos[0].rouboInstFinanc , "roubo_moto" : result.rAssaltos[0].rouboMotoneta, "roubo_extors�o" : result.rAssaltos[0].rouboExtorsao },
            {"ano" :result.rAssaltos[1].ano ,"roubo_carga" : result.rAssaltos[1].rouboCarga  ,  "roubo_estabelecimento" : result.rAssaltos[1].rouboEstabelecimento ,"roubo_institui��o_financeira" : result.rAssaltos[1].rouboInstFinanc , "roubo_moto" : result.rAssaltos[1].rouboMotoneta, "roubo_extors�o" : result.rAssaltos[1].rouboExtorsao },
            //{"ano" :result.rAssaltos[2].ano , "roubo_carga" : result.rAssaltos[2].rouboCarga  ,  "roubo_estabelecimento" : result.rAssaltos[2].rouboEstabelecimento ,"roubo_institui��o_financeira" : result.rAssaltos[2].rouboInstFinanc , "roubo_moto" : result.rAssaltos[2].rouboMotoneta, "roubo_extors�o" : result.rAssaltos[2].rouboExtorsao }

        ];

    	var columnsAssassinatos = [
            {title :  "Ano" , dataKey :  "ano" },
            {title :  "Qtd_Homicidio" , dataKey :  "qtd_homicidio" },
            {title :  "Qtd_Latrocinio" , dataKey :  "qtd_latrocinio" },
            {title :  "Qtd_Arma branca" , dataKey :  "qtd_arma_branca" },
            {title :  "Qtd_Arma de fogo"  , dataKey :  "qtd_arma_fogo" },
            {title :  "Total assassinatos"  , dataKey :  "total_assassi" }
            
            
            
        ]

        var rowsAssassinatos = [

            {"ano" :result.rAssassinatos[0].ano , "qtd_homicidio" : result.rAssassinatos[0].quantidadeHomicidio  ,  "qtd_latrocinio" : result.rAssassinatos[0].quantidadeLatrocinio ,"qtd_arma_branca" : result.rAssassinatos[0].quantidadeArmabranca , "qtd_arma_fogo" : result.rAssassinatos[0].quantidadeArmafogo, "totalrassassi" : result.rAssassinatos[0].totarAssassinatos },
            {"ano" :result.rAssassinatos[1].ano ,"qtd_homicidio" : result.rAssassinatos[1].quantidadeHomicidio  ,  "qtd_latrocinio" : result.rAssassinatos[1].quantidadeLatrocinio ,"qtd_arma_branca" : result.rAssassinatos[1].quantidadeArmabranca, "qtd_arma_fogo" : result.rAssassinatos[1].quantidadeArmafogo, "totalrassassi" : result.rAssassinatos[1].totarAssassinatos },
            //{"ano" :result.rAssassinatos[2].ano , "qtd_homicidio" : result.rAssassinatos[2].quantidadeHomicidio  ,  "qtd_latrocinio" : result.rAssassinatos[2].quantidadeLatrocinio ,"qtd_arma_branca" : result.rAssassinatos[2].quantidadeArmabranca, "qtd_arma_fogo" : result.rAssassinatos[2].quantidadeArmafogo, "totalrassassi" : result.rAssassinatos[2].totarAssassinatos }

        ];

        // Only pt supported (not mm or in)
        var doc = new jsPDF('p', 'pt');
    	var startingPage = doc.internal.getCurrentPageInfo().pageNumber;
        doc.autoTable(columnsAssaltos, rowsAssaltos,{
            styles: {fillColor: [100, 255, 255]},
            margin: {top: 60},
            avoidPageSplit: true,
            addPageContent: function(data) {
            	doc.text("Munic�pio: "+result.rAssaltos[0].regiao, 40, 30);
            }
        });
        doc.autoTable(columnsAssassinatos, rowsAssassinatos,{
            styles: {fillColor: [100, 255, 255], overflow: 'linebreak'},
            margin: {top: 210},
            addPageContent: function(data) {
            }        
        });
        doc.save('table.pdf');   
    });
}

    var regioes = [
                        [
                        'Caruaru',
                        'Ibirajuba',
                        'Alagoinha',
                        'Sair�',
                        'Riacho das Almas',
                        'Jata�ba',
                        'Sanhar�',
                        'Tacaimb�',
                        'Camocim de S�o F�lix',
                        'Agrestina',
                        'Panelas',
                        'Cachoeirinha',
                        'Bezerros',
                        'Belo Jardim',
                        'Gravat�',
                        'Po��o',
                        'Barra de Guabiraba',
                        'Lagoa dos Gatos',
                        'Altinho',
                        'S�o Caitano',
                        'Pesqueira',
                        'Bonito',
                        'Brejo da Madre de Deus',
                        'S�o Joaquim do Monte',
                        'S�o Bento do Una',
                        'Cupira'
                        ],

                        [
                        'Garanhuns',
                        'Cal�ado',
                        'Salo�',
                        'Correntes',
                        'Iati',
                        'Jurema',
                        'Bom Conselho',
                        'Jupi',
                        'Ita�ba',
                        'Pedra',
                        'Caet�s',
                        '�guas Belas',
                        'Bu�que',
                        'Lajedo',
                        'Garanhuns',
                        'Lagoa do Ouro',
                        'Palmeirina',
                        'Terezinha',
                        'Angelim',
                        'Jucati',
                        'Paranatama',
                        'Brej�o',
                        'Canhotinho',
                        'Capoeiras',
                        'Tupanatinga',
                        'S�o Jo�o',
                        'Venturosa',
                        ],

                        [
                        'Cumaru',
                        'Salgadinho',
                        'Frei Miguelinho',
                        'Feira Nova',
                        'Machados',
                        'Jo�o Alfredo',
                        'Vertentes',
                        'Limoeiro',
                        'Surubim',
                        'Taquaritinga do Norte',
                        'Bom Jardim',
                        'Santa Cruz do Capibaribe',
                        'Toritama',
                        'Vertente do L�rio',
                        'Orob�',
                        'Passira',
                        'Casinhas',
                        'Santa Maria do Cambuc�',
                        'S�o Vicente Ferrer'
                        ],

                        [
                        'Camutanga',
                        'Ferreiros',
                        'Itaquitinga',
                        'Buenos Aires',
                        'Ch� de Alegria',
                        'Macaparana',
                        'Condado',
                        'Gl�ria do Goit�',
                        'Nazar� da Mata',
                        'Lagoa de Itaenga',
                        'Lagoa do Carro',
                        'Timba�ba',
                        'Paudalho',
                        'Tracunha�m',
                        'Alian�a',
                        'Vic�ncia',
                        'Itamb�',
                        'Goiana',
                        'Carpina'
                        ],

                        [
                        'Vit�ria de Santo Ant�o',
                        'Bel�m de Maria',
                        'Joaquim Nabuco',
                        'Quipap�',
                        'Cort�s',
                        'Jaqueira',
                        'Maraial',
                        '�gua Preta',
                        'Ch� Grande',
                        'S�o Benedito do Sul',
                        'Barreiros',
                        'Palmares',
                        'S�o Jos� da Coroa Grande',
                        'Sirinha�m',
                        'Escada',
                        'Primavera',
                        'Xex�u',
                        'Tamandar�',
                        'Pombos',
                        'Rio Formoso',
                        'Amaraji',
                        'Catende',
                        'Gameleira',
                        'Ribeir�o'
                        ],

                        [
                        'Cabo de Santo Agostinho',
                        'Camaragibe',
                        'Igarassu',
                        'Jaboat�o dos Guararapes',
                        'Olinda',
                        'Paulista',
                        'Recife',
                        'S�o Louren�o da Mata',
                        'Fernando de Noronha',
                        'Itapissuma',
                        'Ilha de Itamarac�',
                        'Moreno',
                        'Abreu e Lima',
                        'Ipojuca',
                        'Ara�oiaba'
                        ],

                        [
                        'Mirandiba',
                        'Cedro',
                        'Salgueiro',
                        'Serrita',
                        'Terra Nova',
                        'Verdejante',
                        'Parnamirim',
                        'S�o Jos� do Belmonte'
                        ],

                        [
                        'Itacuruba',
                        'Jatob�',
                        'Carnaubeira da Penha',
                        'Bel�m do S�o Francisco',
                        'Tacaratu',
                        'Petrol�ndia',
                        'Floresta'
                        ],

                        [
                        'Granito',
                        'Moreil�ndia',
                        'Santa Cruz',
                        'Santa Filomena',
                        'Bodoc�',
                        'Ipubi',
                        'Exu',
                        'Ouricuri',
                        'Trindade',
                        'Araripina'
                        ],

                        [
                        'Bet�nia',
                        'Manari',
                        'Cust�dia',
                        'Ibimirim',
                        'Inaj�',
                        'Sert�nia',
                        'Arcoverde'
                        ],

                        [
                        'Brejinho',
                        'Carna�ba',
                        'Flores',
                        'Santa Cruz da Baixa Verde',
                        'Itapetim',
                        'Ingazeira',
                        'Calumbi',
                        'Quixaba',
                        'Solid�o',
                        'Iguaraci',
                        'Triunfo',
                        'Tuparetama',
                        'Santa Terezinha',
                        'Tabira',
                        'S�o Jos� do Egito',
                        'Afogados da Ingazeira',
                        'Serra Talhada'
                        ],

                        [
                        'Petrolina',
                        'Afr�nio',
                        'Dormentes',
                        'Oroc�',
                        'Cabrob�',
                        'Lagoa Grande',
                        'Santa Maria da Boa Vista'
                        ]

                        ]


   
    


</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAU4tZgF7qKxiAMdKz8j0Pa3_TVyNdZgjM&callback=initMap"></script>   
