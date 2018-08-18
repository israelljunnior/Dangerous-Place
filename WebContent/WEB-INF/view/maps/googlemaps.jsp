<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="map"></div>
<div id='containerGraficos' style='width: 100%;'><canvas id='grafico'></canvas></div>
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
		zoom: 8,
		styles:style
    });
    
   

	
	geocoder = new google.maps.Geocoder();

     //buttons

     
 

	
    var inputSearch = document.createElement('div');
    var inputSearchInput = new createInputSearch(inputSearch, map);

    inputSearchInput.index = 1;
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(inputSearch); 
    
  
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
		
		
		
		var marker;
		infoWindowMaker = new google.maps.InfoWindow();
		
		marker = new google.maps.Marker({
			map : map,
			draggable : true,
			position : (event.latLng)
		})

		marker.addListener('click', function() {
			infoWindowMaker.setContent(document.getElementById("canvas"+infoWindowMaker.id));
			infoWindowMaker.open(map, this);
		});

		marker.addListener('dblclick', function() {
			marker.setMap(null)
			marker = null
		});

		geocoder.geocode({
			'latLng' : marker.getPosition()
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
							
							var id = gerarGraficoMunicipio(municipio);
							infoWindowMaker.id = id;
							infoWindowMaker.setContent(document.getElementById("canvas"+infoWindowMaker.id));
						} else {
							gerarGraficosRegiao(mesorregiao);
						}
						infoWindowMaker.open(map, marker);
					} else {
						infoWindowMaker.setContent("Dados não disponíveis em: "+results[0].address_components[indexState].short_name
								+"<br />"+results[0].formatted_address);
						infoWindowMaker.open(map, marker);
					}
				}
			}	
		})

		marker.addListener('dragend', function() {

			geocoder.geocode({
				'latLng' : marker.getPosition()
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
                            alert(municipio);
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
                            alert(mesorregiao);

                        }
    						
    						infoWindowMaker.setContent("<style type='text/css'> #h4{ margin-right: 685px;}canvas {-moz-user-select: none;-webkit-user-select: none;-ms-user-select: none;}.balao2{background:  #ffffff;border-radius: 15px; width: 500px;height: 150px;margin-top: 100px;  margin-bottom: 100px; margin-right: 150px;margin-left: 80px;text-align: center;position: relative;}.balao2:after{ content: '';width: 50px;height: 0px;position: absolute;border-left: 20px solid transparent;border-right: 20px solid transparent;border-top: 20px solid #ffffff;bottom: -20px;left: 30%;} </style> <div class='balao2'>     <div class='container'>          <div class='row'>                         <table class='table' border='3'>                <thead>                <div class='col-sm-2' >                    <th><button type='button' id='Assassinatos' class='btn btn-danger' style='margin-top: 50px; color:#000000 '>Assassinatos</button></th>                </div>                                               <div class='col-sm-1'>                       <th><button type='button' id='Assaltos' class='btn btn-danger' style='margin-top: 50px;' >Assaltos</button></th>                </div>                                     <div class='col-sm-2'>                    <th><button type='button' id='Acidentes' class='btn btn-danger' style='margin-top: 50px;' >Acidentes</button></th>                </div>                </thead>                <tbody>                        <td colspan='3'>                                  <canvas id='canvas'>                                                             </canvas>                              </td>                       </tbody>            </table>                       </div>                </div> ");
							infoWindowMaker.open(map, marker);
						} else {
							infoWindowMaker.setContent("Dados não disponíveis em: "+results[0].address_components[indexState].short_name
									+"<br />"+results[0].formatted_address);
							infoWindowMaker.open(map, marker);
						}
					}
				}
			});
		}); markers.push(marker); infoWindows.push(infoWindowMaker);

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
                
                geocoder.geocode({"latLng":pos}, function(results, status){
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
                                alert(municipio);
    						} else {

                                results[0].address_components.forEach(ac => {
                                    if(ac.types[0] == filtroMun){
                                        municipio = ac.short_name;
                                        
                                    }
    
                                });
                                alert(municipio);
                                var mesorregiao;
                                var positionMesorregiao;
                                var arrayMesorregiaos= ["Agreste Central","Agreste Meridional","Agreste Setentrional","Mata Norte","Mata Sul","Metropolitana","Sertão Central","Sertão De Itaparica","Sertão Do Araripe","Sertão Do Moxoto","Sertão Do Pajeu","Sertão Do São Francisco"]
                                for(i = 0; i < regioes.length; i++) {
                                	for(j = 0; j < regioes[i].length; j++){
                                        if(regioes[i][j] == municipio){
                                            positionMesorregiao = i;
                                            break;
                                        } alert(regioes[i][j]);
                                    }
                                    if(typeof ositionMesorregiao !== "undefined"){break;}
                                }
                                mesorregiao = arrayMesorregiaos[positionMesorregiao];
                                
                                alert(mesorregiao);
                            }
    						
    						infoWindowLocalizacao.setContent("<style type='text/css'> #h4{ margin-right: 685px;}.balao2{background:  #ffffff;border-radius: 15px; width: 500px;height: 150px;margin-top: 100px;  margin-bottom: 100px; margin-right: 150px;margin-left: 80px;text-align: center;position: relative;}.balao2:after{ content: '';width: 50px;height: 0px;position: absolute;border-left: 20px solid transparent;border-right: 20px solid transparent;border-top: 20px solid #ffffff;bottom: -20px;left: 30%;}</style><div class='balao2'><div class='container'> <div class='row'><h4 id='h4'>Selecione os tipos de dados que você deseja referente à "+municipio+":</h4><div class='col-sm-2' > <button type='button' id='Assassinatos' class='btn btn-danger' style='margin-top: 50px; color:#000000 '>Assassinatos</button></div> <div class='col-sm-1'><button type='button' id='Assaltos' class='btn btn-danger' style='margin-top: 50px;' >Assaltos</button></div> <div class='col-sm-2'><button type='button' id='Acidentes' class='btn btn-danger' style='margin-top: 50px;' >Acidentes</button></div> </div></div></div>");
    						infoWindowLocalizacao.open(map)
    						} else {
    							infoWindowLocalizacao.setContent("Dados não disponíveis em: "+results[0].address_components[indexState].short_name
    									+"<br />"+results[0].formatted_address);
    							infoWindowLocalizacao.open(map);
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
    controlText.innerHTML = 'Desfazer Marcações';
    controlUI.appendChild(controlText);

    // Setup the click event listeners: simply set the map to Chicago.
    controlUI.addEventListener('click', function() {
    	
    	markers.forEach(m => {
    		m.setMap(null)
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
    controlText.innerHTML = '<select id="selectMunicipioOrRegiao"class="selectpicker" onchange="changeSelected()"><option value="m">Município</option><option value="r">Região</option></select>';
    controlUI.appendChild(controlText);
    }
    
    function changeSelected() {
    	var select = document.getElementById("selectMunicipioOrRegiao");
    	selected = select.options[select.selectedIndex].value;
    }

    function createInputSearch(controlDiv, map) {

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
    controlText.style.paddingLeft = '4px';
    controlText.style.paddingRight = '4px';
    controlText.innerHTML = '<input type="text" style="height:38px; position:relative;" class="form-control" placeholder=" Digite uma municipio" />';
    controlUI.appendChild(controlText);
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
<script>
	
function gerarGraficoMunicipio(municipio) {
	alert(municipio);
	$.post("/PP2-DangerousPlace/dadosMuncipio", {'municipio':municipio}, function(result){
		console.log(result);
	});

var color = Chart.helpers.color;
		var barChartData = {
			labels: ['2015', '2016', '2017', '2018'],
			datasets: [{
				label: 'Assassinatos',
				backgroundColor: color(window.chartColors.red).alpha(4.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					30,
					40,
					50,
					34
				]
			}, {
				label: 'Assaltos',
				backgroundColor: color(window.chartColors.black).alpha(4.5).rgbString(),
				borderColor: window.chartColors.black,
				borderWidth: 1,
				data: [
					60,
					23,
					30,
					25
				]
			},{
				label: 'Acidentes',
				backgroundColor: color(window.chartColors.green).alpha(4.5).rgbString(),
				borderColor: window.chartColors.green,
				borderWidth: 1,
				data: [
						15,
						50,
						70,
						67
					]
			}]
		};
		var canvas = document.createElement('canvas');
		var div = document.getElementById('containerGraficos');
		div.appendChild(canvas);
		var id = Math.random();
		canvas.setAttribute('id',"canvas"+id);
		var ctx = document.getElementById('canvas'+id);
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
						text: 'Estatisticas de Pernambuco',
						fontSize: 17
					}
				}
			}); return id;
		
};

function gerarGraficosRegiao(regiao) {
	
	
	$.post("/PP2-DangerousPlace/dadosRegiao", {'data':dados}, function(result){
		alert(result);
		console.log(result);
	});
	
	
};
	
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAU4tZgF7qKxiAMdKz8j0Pa3_TVyNdZgjM&callback=initMap"></script>   
