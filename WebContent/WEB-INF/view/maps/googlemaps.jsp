<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id='containerGraficos' style='width: 100%;'></div><div id="wrapper"><div id="sidebar-wrapper"> Conteúdo do tutorial fica aqui!!</div></div><div id="map"></div>

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
    
    var tutorialControlDiv = document.createElement('div');
    var tutoControl = new tutorialControl(tutorialControlDiv, map);
    
    tutoControl.index = 6;
    map.controls[google.maps.ControlPosition.RIGHT_CENTER].push(tutorialControlDiv);

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
                        var arrayMesorregiaos= ["Agreste Central","Agreste Meridional","Agreste Setentrional","Mata Norte","Mata Sul","Metropolitana","Sertão Central","Sertão De Itaparica","Sertão Do Araripe","Sertão Do Moxoto","Sertão Do Pajeu","Sertão Do São Francisco"]
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
					    					result.mAssassinatos[2].totalAssassinatos
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
					    			},{
					    				label: 'Violência Sexual',
					    				backgroundColor: color(window.chartColors.purple).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.purple,
					    				borderWidth: 1,
					    				data: [  
					    	                
					    					result.mViolSex[0].TotalSex,
					    					result.mViolSex[1].TotalSex,
					    					result.mViolSex[2].TotalSex,
					    	            ]
					    			}
					    			
					    			]
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
					    		var buttonTextGerar = document.createTextNode("Gerar Relatório");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioMunicipio('"+result.mAssaltos[0].municipio+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Comentários");
					    		
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
					    					result.rAssassinatos[2].totalAssassinatos
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
					    	            ]
					    			},{
					    				label: 'Violência Sexual',
					    				backgroundColor: color(window.chartColors.purple).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.purple,
					    				borderWidth: 1,
					    				data: [
					    					
					    					result.rViolSex[0].totalSex,
					    					result.rViolSex[1].totalSex,
					    					result.rViolSex[2].totalSex,
					    					
					    					
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
					    		var buttonTextGerar = document.createTextNode("Gerar Relatório");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioRegiao('"+result.rAssaltos[0].regiao+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Comentários");
					    		
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
						markers[positionMarker]['infoWindow'].setContent("Dados não disponíveis em: "+results[0].address_components[indexState].short_name
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
                            var arrayMesorregiaos= ["Agreste Central","Agreste Meridional","Agreste Setentrional","Mata Norte","Mata Sul","Metropolitana","Sertão Central","Sertão De Itaparica","Sertão Do Araripe","Sertão Do Moxoto","Sertão Do Pajeu","Sertão Do São Francisco"]
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
					    					result.mAssassinatos[2].totalAssassinatos
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
					    			},{
					    				label: 'Violência Sexual',
					    				backgroundColor: color(window.chartColors.purple).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.purple,
					    				borderWidth: 1,
					    				data: [
					    					
					    					result.rViolSex[0].totalSex,
					    					result.rViolSex[1].totalSex,
					    					result.rViolSex[2].totalSex,
					    					
					    					
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
					    		var buttonTextGerar = document.createTextNode("gerar Relarótio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioMunicipio('"+result.mAssaltos[0].municipio+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Comentários");
					    		
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
					    					result.rAssassinatos[2].totalAssassinatos
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
					    				label: 'Violência Sexual',
					    				backgroundColor: color(window.chartColors.purple).alpha(4.5).rgbString(),
					    				borderColor: window.chartColors.purple,
					    				borderWidth: 1,
					    				data: [
					    					
					    					result.rViolSex[0].totalSex,
					    					result.rViolSex[1].totalSex,
					    					result.rViolSex[2].totalSex,
					    					
					    					
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
					    		var buttonTextGerar = document.createTextNode("gerar Relarótio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioMunicipio('"+result.mAssaltos[0].regiao+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Comentários");
					    		
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
					    						text: 'Estatisticas de '+result.mAssaltos[0].regiao,
					    						fontSize: 17
					    					}
					    				}
					    			
					    			});
					    			
					    				
					    				
                                    markers[positionMarker]['infoWindow'].setContent(divWithin);
                                    markers[positionMarker]['infoWindow'].open(map, markers[positionMarker]);

					    	});
							
						}
						} else {
							markers[positionMarker]['infoWindow'].setContent("Dados não disponíveis em: "+results[0].address_components[indexState].short_name
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
    controlUI.style.borderTop="5px solid transparent";
    controlUI.style.borderBottom="5px solid transparent";
    controlUI.style.borderLeft="5px solid black";
    // Set CSS for the control interior.
    var controlText = document.createElement('div');
    controlText.style.color = 'rgb(25,25,25)';
    controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
    controlText.style.fontSize = '16px';
    controlText.style.lineHeight = '38px';
    controlText.style.paddingLeft = '5px';
    controlText.style.paddingRight = '5px';
    controlText.innerHTML = 'Minha Localização';
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
                                var arrayMesorregiaos= ["Agreste Central","Agreste Meridional","Agreste Setentrional","Mata Norte","Mata Sul","Metropolitana","Sertão Central","Sertão De Itaparica","Sertão Do Araripe","Sertão Do Moxoto","Sertão Do Pajeu","Sertão Do São Francisco"]
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
    					    					result.mAssassinatos[2].totalAssassinatos
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
    					    			},{
    					    				label: 'Violência Sexual',
    					    				backgroundColor: color(window.chartColors.purple).alpha(4.5).rgbString(),
    					    				borderColor: window.chartColors.purple,
    					    				borderWidth: 1,
    					    				data: [
    					    					
    					    					result.mViolSex[0].TotalSex,
    					    					result.mViolSex[1].TotalSex,
    					    					result.mViolSex[2].TotalSex,
    					    					
    					    					
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
					    		var buttonTextGerar = document.createTextNode("gerar Relarótio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioMunicipio('"+result.mAssaltos[0].municipio+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Comentários");
					    		
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
    					    					result.rAssassinatos[2].totalAssassinatos
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
    					    	            ]
    					    			},{
    					    				label: 'Violência Sexual',
    					    				backgroundColor: color(window.chartColors.purple).alpha(4.5).rgbString(),
    					    				borderColor: window.chartColors.purple,
    					    				borderWidth: 1,
    					    				data: [
    					    					result.rViolSex[0].totalSex,
    					    					result.rViolSex[1].totalSex,
    					    					result.rViolSex[2].totalSex,
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
					    		var buttonTextGerar = document.createTextNode("gerar Relarótio");

					    		buttonGerar.setAttribute("class", "btn btn-danger pull-right");
					    		buttonGerar.appendChild(buttonTextGerar);
                                buttonGerar.setAttribute("onclick", "gerarRelatorioRegiao('"+result.rAssaltos[0].regiao+"')");

					    		var buttonComen = document.createElement("BUTTON");
					    		var buttonTextComen = document.createTextNode("Comentários");
					    		
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
    							markers[positionMarker]['infoWindow'].setContent("Dados não disponíveis em: "+results[0].address_components[indexState].short_name
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
    controlUI.style.borderTop="5px solid transparent";
    controlUI.style.borderBottom="5px solid transparent";
    controlUI.style.borderLeft="5px solid black";
    // Set CSS for the control interior.
    var controlText = document.createElement('div');
    controlText.style.color = 'rgb(25,25,25)';
    controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
    controlText.style.fontSize = '16px';
    controlText.style.lineHeight = '38px';
    controlText.style.paddingLeft = '5px';
    controlText.style.paddingRight = '5px';
    controlText.innerHTML = 'Desfazer Marcações';
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
    controlUI.style.borderTop="5px solid transparent";
    controlUI.style.borderBottom="5px solid transparent";
    controlUI.style.borderLeft="5px solid black";
    // Set CSS for the control interior.
    var controlText = document.createElement('div');
    controlText.style.color = 'rgb(25,25,25)';
    controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
    controlText.style.fontSize = '16px';
    controlText.style.lineHeight = '38px';
    controlText.style.paddingLeft = '5px';
    controlText.style.paddingRight = '5px';
    controlText.innerHTML = '<select id="selectMunicipioOrRegiao"class="selectpicker" onchange="changeSelected()"><option value="m">Município</option><option value="r">Região</option></select>';
    controlUI.appendChild(controlText);
    }
    
    function changeSelected() {
    	var select = document.getElementById("selectMunicipioOrRegiao");
    	selected = select.options[select.selectedIndex].value;
    }
    
    function tutorialControl(controlDiv, map) {

    	// Set CSS for the control border.
        var controlUI = document.createElement('div');
        controlUI.style.backgroundColor = '#fff';
        controlUI.style.border = '1px solid #fff';
        controlUI.style.borderRadius = '2px';
        controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
        controlUI.style.cursor = 'pointer';
        controlUI.style.marginBottom = '40px';
        controlUI.style.borderTop="5px solid transparent";
        controlUI.style.borderBottom="5px solid transparent";
        controlUI.style.borderLeft="5px solid red";
        
        controlUI.style.textAlign = 'center';
        controlUI.title = 'Click to recenter the map';
        controlDiv.appendChild(controlUI);
        // Set CSS for the control interior.
        var controlText = document.createElement('div');
        controlText.style.color = 'rgb(25,25,25)';
        controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
        controlText.style.fontSize = '100%';
        controlText.style.lineHeight = '38px';
        controlText.style.paddingLeft = '5px';
        controlText.style.paddingRight = '5px';
        controlText.innerHTML = 'Tutorial Mapa';
        controlUI.appendChild(controlText);
		
        controlUI.addEventListener('click', function(e) {
                 e.preventDefault();
                 $("#wrapper").toggleClass("toggled");
             }); 
                  	
       
        
        // Setup the click event listeners: simply set the map to Chicago.
      }
    
    
    
    function gerarRelatorioMunicipio(municipio) {

        $.post("/PP2-DangerousPlace/dadosMunicipio", {'municipio': municipio}, function(result){
        	
    	var columnsAssaltos = [
            {title :  "Ano" , dataKey :  "ano" },
            {title :  "Roubo a carga" , dataKey :  "roubo_carga" },
            {title :  "Roubo a lojas" , dataKey :  "roubo_estabelecimento" },
            {title :  "Roubo a bancos" , dataKey :  "roubo_instituição_financeira" },
            {title :  "Roubo a moto" , dataKey :  "roubo_moto" },
            {title :  "Extorsão" , dataKey :  "roubo_extorsão" }
             
        ]

    	
        var rowsAssaltos = [

            {"ano" :result.mAssaltos[0].ano , "roubo_carga" : result.mAssaltos[0].rouboCarga  ,  "roubo_estabelecimento" : result.mAssaltos[0].rouboEstabelecimento ,"roubo_instituição_financeira" : result.mAssaltos[0].rouboInstFinanc , "roubo_moto" : result.mAssaltos[0].rouboMotoneta, "roubo_extorsão" : result.mAssaltos[0].rouboExtorsao },
            {"ano" :result.mAssaltos[1].ano ,"roubo_carga" : result.mAssaltos[1].rouboCarga  ,  "roubo_estabelecimento" : result.mAssaltos[1].rouboEstabelecimento ,"roubo_instituição_financeira" : result.mAssaltos[1].rouboInstFinanc , "roubo_moto" : result.mAssaltos[1].rouboMotoneta, "roubo_extorsão" : result.mAssaltos[1].rouboExtorsao },
            {"ano" :result.mAssaltos[2].ano , "roubo_carga" : result.mAssaltos[2].rouboCarga  ,  "roubo_estabelecimento" : result.mAssaltos[2].rouboEstabelecimento ,"roubo_instituição_financeira" : result.mAssaltos[2].rouboInstFinanc , "roubo_moto" : result.mAssaltos[2].rouboMotoneta, "roubo_extorsão" : result.mAssaltos[2].rouboExtorsao }

        ];
        
        
        var columnsAssaltos2 = [
    		  {title :  "Ano" , dataKey :  "ano" },
              {title :  "Roubo a turista" , dataKey :  "roubo_transeunte" },
              {title :  "Roubo a Ônibus" , dataKey :  "roubo_onibus" },
              {title :  "Roubo a Casa" , dataKey :  "roubo_residencias" },
              {title :  "Total de Assaltos" , dataKey :  "total_assalt" }
    	]

    	 var rowsAssaltos2 = [

             {"ano" :result.mAssaltos[0].ano , "roubo_transeunte" : result.mAssaltos[0].rouboTranseunte  ,  "roubo_onibus" : result.mAssaltos[0].rouboOnibus ,"roubo_residencias" : result.mAssaltos[0].rouboResidencias , "total_assalt" : result.mAssaltos[0].totalAssaltos},
             {"ano" :result.mAssaltos[1].ano , "roubo_transeunte" : result.mAssaltos[1].rouboTranseunte  ,  "roubo_onibus" : result.mAssaltos[1].rouboOnibus ,"roubo_residencias" : result.mAssaltos[1].rouboResidencias , "total_assalt" : result.mAssaltos[1].totalAssaltos},
             {"ano" :result.mAssaltos[2].ano , "roubo_transeunte" : result.mAssaltos[2].rouboTranseunte  ,  "roubo_onibus" : result.mAssaltos[2].rouboOnibus ,"roubo_residencias" : result.mAssaltos[2].rouboResidencias , "total_assalt" : result.mAssaltos[2].totalAssaltos}


         ];
    	
    	var columnsAssassinatos2 = [
    		{title :  "Ano" , dataKey :  "ano" },
            {title :  "Mulheres" , dataKey :  "mulheres" },
            {title :  "Homens" , dataKey :  "homens" },
            {title :  "Crianças entre 12" , dataKey :  "idade_Ate12" },
            {title :  "Crianças entre 13 a 17 "  , dataKey :  "idade_13a17" },
            {title :  "Adultos entre 18 a 30"  , dataKey :  "idade_18a30" }
    	]
    	
    	
    	var rowsAssassinatos2 = [

            {"ano" :result.mAssassinatos[0].ano , "mulheres" : result.mAssassinatos[0].quantidadeMulher  ,  "homens" : result.mAssassinatos[0].quantidadeHomem ,"idade_Ate12" : result.mAssassinatos[0].idadeAte12 , "idade_13a17" : result.mAssassinatos[0].idade13a17, "idade_18a30" : result.mAssassinatos[0].idade18a30 },
            {"ano" :result.mAssassinatos[1].ano ,"mulheres" : result.mAssassinatos[1].quantidadeMulher  ,  "homens" : result.mAssassinatos[1].quantidadeHomem ,"idade_Ate12" : result.mAssassinatos[1].idadeAte12, "idade_13a17" : result.mAssassinatos[1].idade13a17, "idade_18a30" : result.mAssassinatos[1].idade18a30 },
            {"ano" :result.mAssassinatos[2].ano , "mulheres" : result.mAssassinatos[2].quantidadeMulher  ,  "homens" : result.mAssassinatos[2].quantidadeHomem ,"idade_Ate12" : result.mAssassinatos[2].idadeAte12, "idade_13a17" : result.mAssassinatos[2].idade13a17, "idade_18a30" : result.mAssassinatos[2].idade18a30 }

        ];
    	
		var columnsAssassinatos = [
    		
            {title :  "Ano" , dataKey :  "ano" },
            {title :  "Homicidios" , dataKey :  "qtd_homicidio" },
            {title :  "Latrocinios" , dataKey :  "qtd_latrocinio" },
            {title :  "Arma branca" , dataKey :  "qtd_arma_branca" },
            {title :  "Arma de fogo"  , dataKey :  "qtd_arma_fogo" },
            {title :  "Total assassinatos"  , dataKey :  "total_assassi" }  
            
        ]

        var rowsAssassinatos = [

            {"ano" :result.mAssassinatos[0].ano , "qtd_homicidio" : result.mAssassinatos[0].quantidadeHomicidio  ,  "qtd_latrocinio" : result.mAssassinatos[0].quantidadeLatrocinio ,"qtd_arma_branca" : result.mAssassinatos[0].quantidadeArmabranca , "qtd_arma_fogo" : result.mAssassinatos[0].quantidadeArmafogo, "total_assassi" : result.mAssassinatos[0].totalAssassinatos },
            {"ano" :result.mAssassinatos[1].ano ,"qtd_homicidio" : result.mAssassinatos[1].quantidadeHomicidio  ,  "qtd_latrocinio" : result.mAssassinatos[1].quantidadeLatrocinio ,"qtd_arma_branca" : result.mAssassinatos[1].quantidadeArmabranca, "qtd_arma_fogo" : result.mAssassinatos[1].quantidadeArmafogo, "total_assassi" : result.mAssassinatos[1].totalAssassinatos },
            {"ano" :result.mAssassinatos[2].ano , "qtd_homicidio" : result.mAssassinatos[2].quantidadeHomicidio  ,  "qtd_latrocinio" : result.mAssassinatos[2].quantidadeLatrocinio ,"qtd_arma_branca" : result.mAssassinatos[2].quantidadeArmabranca, "qtd_arma_fogo" : result.mAssassinatos[2].quantidadeArmafogo, "total_assassi" : result.mAssassinatos[2].totalAssassinatos }

        ];
		
		
		var columnsViolencia = [
			 {title :  "Ano" , dataKey :  "ano" },
			 {title :  "Total de violência sexual em todo o município" , dataKey :  "TotalSex" },
		]
		
		var rowsViolencia = [
			{"ano" : result.mViolSex[0].ano , "TotalSex" : result.mViolSex[0].TotalSex},
			{"ano" : result.mViolSex[1].ano , "TotalSex" : result.mViolSex[1].TotalSex},
			{"ano" : result.mViolSex[2].ano , "TotalSex" : result.mViolSex[2].TotalSex}
		];
		

		
        // Only pt supported (not mm or in)
        var doc = new jsPDF('l', 'pt');
    	var startingPage = doc.internal.getCurrentPageInfo().pageNumber;
        doc.autoTable(columnsAssaltos, rowsAssaltos,{
            styles: {fillColor: [0, 0, 0]},
            margin: {top: 60},
            avoidPageSplit: true,
            addPageContent: function(data) {
            	doc.text("Dangerous Place \n Município: "+result.mAssaltos[0].municipio, 40, 30);
            }
        });
        
        doc.autoTable(columnsAssaltos2, rowsAssaltos2,{
            styles: {fillColor: [0, 0, 0], overflow: 'linebreak'},
            margin: {top: 160},
            addPageContent: function(data) {
            }        
        });
        
     
        doc.autoTable(columnsAssassinatos2, rowsAssassinatos2,{
            styles: {fillColor: [255, 0, 0], overflow: 'linebreak'},
            margin: {top: 270},
            addPageContent: function(data) {
            }        
        });
        
        
        doc.autoTable(columnsAssassinatos, rowsAssassinatos,{
            styles: {fillColor: [255, 0, 0], overflow: 'linebreak'},
            margin: {top: 370},
            addPageContent: function(data) {
            }        
        });
        
        doc.autoTable(columnsViolencia, rowsViolencia,{
            styles: {fillColor: [147, 112, 219], overflow: 'linebreak'},
            margin: {top: 470},
            addPageContent: function(data) {
            }        
        });
        
        
        
        
        doc.save('Relatório de municípios.pdf');   
    });
}

function gerarRelatorioRegiao(mesorregiao) {

    $.post("/PP2-DangerousPlace/dadosRegiao", {'regiao': mesorregiao}, function(result){
    	var columnsAssaltos = [
            {title :  "Ano" , dataKey :  "ano" },
            {title :  "Roubo a carga" , dataKey :  "roubo_carga" },
            {title :  "Roubo a lojas" , dataKey :  "roubo_estabelecimento" },
            {title :  "Roubo a bancos" , dataKey :  "roubo_instituição_financeira" },
            {title :  "Roubo a moto" , dataKey :  "roubo_moto" },
            {title :  "Extorsão" , dataKey :  "roubo_extorsão" }
             
        ]

    	
        var rowsAssaltos = [

            {"ano" :result.rAssaltos[0].ano , "roubo_carga" : result.rAssaltos[0].rouboCarga  ,  "roubo_estabelecimento" : result.rAssaltos[0].rouboEstabelecimento ,"roubo_instituição_financeira" : result.rAssaltos[0].rouboInstFinanc , "roubo_moto" : result.rAssaltos[0].rouboMotoneta, "roubo_extorsão" : result.rAssaltos[0].rouboExtorsao },
            {"ano" :result.rAssaltos[1].ano ,"roubo_carga" : result.rAssaltos[1].rouboCarga  ,  "roubo_estabelecimento" : result.rAssaltos[1].rouboEstabelecimento ,"roubo_instituição_financeira" : result.rAssaltos[1].rouboInstFinanc , "roubo_moto" : result.rAssaltos[1].rouboMotoneta, "roubo_extorsão" : result.rAssaltos[1].rouboExtorsao },
            {"ano" :result.rAssaltos[2].ano , "roubo_carga" : result.rAssaltos[2].rouboCarga  ,  "roubo_estabelecimento" : result.rAssaltos[2].rouboEstabelecimento ,"roubo_instituição_financeira" : result.rAssaltos[2].rouboInstFinanc , "roubo_moto" : result.rAssaltos[2].rouboMotoneta, "roubo_extorsão" : result.rAssaltos[2].rouboExtorsao }

        ];
        
        
        var columnsAssaltos2 = [
    		  {title :  "Ano" , dataKey :  "ano" },
              {title :  "Roubo a turista" , dataKey :  "roubo_transeunte" },
              {title :  "Roubo a Ônibus" , dataKey :  "roubo_onibus" },
              {title :  "Roubo a Casa" , dataKey :  "roubo_residencias" },
              {title :  "Total de Assaltos" , dataKey :  "total_assalt" }
    	]

    	 var rowsAssaltos2 = [

             {"ano" :result.rAssaltos[0].ano , "roubo_transeunte" : result.rAssaltos[0].rouboTranseunte  ,  "roubo_onibus" : result.rAssaltos[0].rouboOnibus ,"roubo_residencias" : result.rAssaltos[0].rouboResidencias , "total_assalt" : result.rAssaltos[0].totalAssaltos},
             {"ano" :result.rAssaltos[1].ano , "roubo_transeunte" : result.rAssaltos[1].rouboTranseunte  ,  "roubo_onibus" : result.rAssaltos[1].rouboOnibus ,"roubo_residencias" : result.rAssaltos[1].rouboResidencias , "total_assalt" : result.rAssaltos[1].totalAssaltos},
             {"ano" :result.rAssaltos[2].ano , "roubo_transeunte" : result.rAssaltos[2].rouboTranseunte  ,  "roubo_onibus" : result.rAssaltos[2].rouboOnibus ,"roubo_residencias" : result.rAssaltos[2].rouboResidencias , "total_assalt" : result.rAssaltos[2].totalAssaltos}


         ];
    	
    	var columnsAssassinatos2 = [
    		{title :  "Ano" , dataKey :  "ano" },
            {title :  "Mulheres" , dataKey :  "mulheres" },
            {title :  "Homens" , dataKey :  "homens" },
            {title :  "Crianças entre 12" , dataKey :  "idade_Ate12" },
            {title :  "Crianças entre 13 a 17 "  , dataKey :  "idade_13a17" },
            {title :  "Adultos entre 18 a 30"  , dataKey :  "idade_18a30" }
    	]
    	
    	
    	var rowsAssassinatos2 = [

            {"ano" :result.rAssassinatos[0].ano , "mulheres" : result.rAssassinatos[0].quantidadeMulher  ,  "homens" : result.rAssassinatos[0].quantidadeHomem ,"idade_Ate12" : result.rAssassinatos[0].idadeAte12 , "idade_13a17" : result.rAssassinatos[0].idade13a17, "idade_18a30" : result.rAssassinatos[0].idade18a30 },
            {"ano" :result.rAssassinatos[1].ano , "mulheres" : result.rAssassinatos[1].quantidadeMulher  ,  "homens" : result.rAssassinatos[1].quantidadeHomem ,"idade_Ate12" : result.rAssassinatos[1].idadeAte12,  "idade_13a17" : result.rAssassinatos[1].idade13a17, "idade_18a30" : result.rAssassinatos[1].idade18a30 },
            {"ano" :result.rAssassinatos[2].ano , "mulheres" : result.rAssassinatos[2].quantidadeMulher  ,  "homens" : result.rAssassinatos[2].quantidadeHomem ,"idade_Ate12" : result.rAssassinatos[2].idadeAte12,  "idade_13a17" : result.rAssassinatos[2].idade13a17, "idade_18a30" : result.rAssassinatos[2].idade18a30 }

        ];
    	
		var columnsAssassinatos = [
    		
            {title :  "Ano" , dataKey :  "ano" },
            {title :  "Homicidios" , dataKey :  "qtd_homicidio" },
            {title :  "Latrocinios" , dataKey :  "qtd_latrocinio" },
            {title :  "Arma branca" , dataKey :  "qtd_arma_branca" },
            {title :  "Arma de fogo"  , dataKey :  "qtd_arma_fogo" },
            {title :  "Total assassinatos"  , dataKey :  "total_assassi" }  
            
        ]

        var rowsAssassinatos = [

            {"ano" :result.rAssassinatos[0].ano , "qtd_homicidio" : result.rAssassinatos[0].quantidadeHomicidio  ,  "qtd_latrocinio" : result.rAssassinatos[0].quantidadeLatrocinio ,"qtd_arma_branca" : result.rAssassinatos[0].quantidadeArmabranca , "qtd_arma_fogo" : result.rAssassinatos[0].quantidadeArmafogo, "total_assassi" : result.rAssassinatos[0].totalAssassinatos },
            {"ano" :result.rAssassinatos[1].ano , "qtd_homicidio" : result.rAssassinatos[1].quantidadeHomicidio  ,  "qtd_latrocinio" : result.rAssassinatos[1].quantidadeLatrocinio ,"qtd_arma_branca" : result.rAssassinatos[1].quantidadeArmabranca,  "qtd_arma_fogo" : result.rAssassinatos[1].quantidadeArmafogo, "total_assassi" : result.rAssassinatos[1].totalAssassinatos },
            {"ano" :result.rAssassinatos[2].ano , "qtd_homicidio" : result.rAssassinatos[2].quantidadeHomicidio  ,  "qtd_latrocinio" : result.rAssassinatos[2].quantidadeLatrocinio ,"qtd_arma_branca" : result.rAssassinatos[2].quantidadeArmabranca,  "qtd_arma_fogo" : result.rAssassinatos[2].quantidadeArmafogo, "total_assassi" : result.rAssassinatos[2].totalAssassinatos }

        ];
		
		
		var columnsViolencia = [
			 {title :  "Ano" , dataKey :  "ano" },
			 {title :  "Total de violência sexual em todo o município" , dataKey :  "TotalSex" },
		]
		
		var rowsViolencia = [
			{"ano" : result.rViolSex[0].ano , "TotalSex" : result.rViolSex[0].TotalSex},
			{"ano" : result.rViolSex[1].ano , "TotalSex" : result.rViolSex[1].TotalSex},
			{"ano" : result.rViolSex[2].ano , "TotalSex" : result.rViolSex[2].TotalSex}
		];

        // Only pt supported (not mm or in)
        var doc = new jsPDF('l', 'pt');
    	var startingPage = doc.internal.getCurrentPageInfo().pageNumber;
        doc.autoTable(columnsAssaltos, rowsAssaltos,{
            styles: {fillColor: [0, 0, 0]},
            margin: {top: 60},
            avoidPageSplit: true,
            addPageContent: function(data) {
            	doc.text("Município: "+result.rAssaltos[0].regiao, 40, 30);
            }
        });

        doc.autoTable(columnsAssaltos2, rowsAssaltos2,{
            styles: {fillColor: [0, 0, 0], overflow: 'linebreak'},
            margin: {top: 160},
            addPageContent: function(data) {
            }        
        });
        
     
        doc.autoTable(columnsAssassinatos2, rowsAssassinatos2,{
            styles: {fillColor: [255, 0, 0], overflow: 'linebreak'},
            margin: {top: 300},
            addPageContent: function(data) {
            }        
        });
        
        
        doc.autoTable(columnsAssassinatos, rowsAssassinatos,{
            styles: {fillColor: [255, 0, 0], overflow: 'linebreak'},
            margin: {top: 350},
            addPageContent: function(data) {
            }        
        });
        
        doc.autoTable(columnsViolencia, rowsViolencia,{
            styles: {fillColor: [147, 112, 219], overflow: 'linebreak'},
            margin: {top: 450},
            addPageContent: function(data) {
            }        
        });
        doc.save('Relatório de regiões.pdf');   
    });
}

    var regioes = [
                        [
                        'Caruaru',
                        'Ibirajuba',
                        'Alagoinha',
                        'Sairé',
                        'Riacho das Almas',
                        'Jataúba',
                        'Sanharó',
                        'Tacaimbó',
                        'Camocim de São Félix',
                        'Agrestina',
                        'Panelas',
                        'Cachoeirinha',
                        'Bezerros',
                        'Belo Jardim',
                        'Gravatá',
                        'Poção',
                        'Barra de Guabiraba',
                        'Lagoa dos Gatos',
                        'Altinho',
                        'São Caitano',
                        'Pesqueira',
                        'Bonito',
                        'Brejo da Madre de Deus',
                        'São Joaquim do Monte',
                        'São Bento do Una',
                        'Cupira'
                        ],

                        [
                        'Garanhuns',
                        'Calçado',
                        'Saloá',
                        'Correntes',
                        'Iati',
                        'Jurema',
                        'Bom Conselho',
                        'Jupi',
                        'Itaíba',
                        'Pedra',
                        'Caetés',
                        'Águas Belas',
                        'Buíque',
                        'Lajedo',
                        'Garanhuns',
                        'Lagoa do Ouro',
                        'Palmeirina',
                        'Terezinha',
                        'Angelim',
                        'Jucati',
                        'Paranatama',
                        'Brejão',
                        'Canhotinho',
                        'Capoeiras',
                        'Tupanatinga',
                        'São João',
                        'Venturosa',
                        ],

                        [
                        'Cumaru',
                        'Salgadinho',
                        'Frei Miguelinho',
                        'Feira Nova',
                        'Machados',
                        'João Alfredo',
                        'Vertentes',
                        'Limoeiro',
                        'Surubim',
                        'Taquaritinga do Norte',
                        'Bom Jardim',
                        'Santa Cruz do Capibaribe',
                        'Toritama',
                        'Vertente do Lério',
                        'Orobó',
                        'Passira',
                        'Casinhas',
                        'Santa Maria do Cambucá',
                        'São Vicente Ferrer'
                        ],

                        [
                        'Camutanga',
                        'Ferreiros',
                        'Itaquitinga',
                        'Buenos Aires',
                        'Chã de Alegria',
                        'Macaparana',
                        'Condado',
                        'Glória do Goitá',
                        'Nazaré da Mata',
                        'Lagoa de Itaenga',
                        'Lagoa do Carro',
                        'Timbaúba',
                        'Paudalho',
                        'Tracunhaém',
                        'Aliança',
                        'Vicência',
                        'Itambé',
                        'Goiana',
                        'Carpina'
                        ],

                        [
                        'Vitória de Santo Antão',
                        'Belém de Maria',
                        'Joaquim Nabuco',
                        'Quipapá',
                        'Cortês',
                        'Jaqueira',
                        'Maraial',
                        'Água Preta',
                        'Chã Grande',
                        'São Benedito do Sul',
                        'Barreiros',
                        'Palmares',
                        'São José da Coroa Grande',
                        'Sirinhaém',
                        'Escada',
                        'Primavera',
                        'Xexéu',
                        'Tamandaré',
                        'Pombos',
                        'Rio Formoso',
                        'Amaraji',
                        'Catende',
                        'Gameleira',
                        'Ribeirão'
                        ],

                        [
                        'Cabo de Santo Agostinho',
                        'Camaragibe',
                        'Igarassu',
                        'Jaboatão dos Guararapes',
                        'Olinda',
                        'Paulista',
                        'Recife',
                        'São Lourenço da Mata',
                        'Fernando de Noronha',
                        'Itapissuma',
                        'Ilha de Itamaracá',
                        'Moreno',
                        'Abreu e Lima',
                        'Ipojuca',
                        'Araçoiaba'
                        ],

                        [
                        'Mirandiba',
                        'Cedro',
                        'Salgueiro',
                        'Serrita',
                        'Terra Nova',
                        'Verdejante',
                        'Parnamirim',
                        'São José do Belmonte'
                        ],

                        [
                        'Itacuruba',
                        'Jatobá',
                        'Carnaubeira da Penha',
                        'Belém do São Francisco',
                        'Tacaratu',
                        'Petrolândia',
                        'Floresta'
                        ],

                        [
                        'Granito',
                        'Moreilândia',
                        'Santa Cruz',
                        'Santa Filomena',
                        'Bodocó',
                        'Ipubi',
                        'Exu',
                        'Ouricuri',
                        'Trindade',
                        'Araripina'
                        ],

                        [
                        'Betânia',
                        'Manari',
                        'Custódia',
                        'Ibimirim',
                        'Inajá',
                        'Sertânia',
                        'Arcoverde'
                        ],

                        [
                        'Brejinho',
                        'Carnaíba',
                        'Flores',
                        'Santa Cruz da Baixa Verde',
                        'Itapetim',
                        'Ingazeira',
                        'Calumbi',
                        'Quixaba',
                        'Solidão',
                        'Iguaraci',
                        'Triunfo',
                        'Tuparetama',
                        'Santa Terezinha',
                        'Tabira',
                        'São José do Egito',
                        'Afogados da Ingazeira',
                        'Serra Talhada'
                        ],

                        [
                        'Petrolina',
                        'Afrânio',
                        'Dormentes',
                        'Orocó',
                        'Cabrobó',
                        'Lagoa Grande',
                        'Santa Maria da Boa Vista'
                        ]

                        ]


   
    


</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sidebar.css">
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAU4tZgF7qKxiAMdKz8j0Pa3_TVyNdZgjM&callback=initMap"></script>
