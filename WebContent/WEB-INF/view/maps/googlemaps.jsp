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
var makers = [];
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
		
		
		
		var maker;
		infoWindowMaker = new google.maps.InfoWindow();
		
		maker = new google.maps.Marker({
			map : map,
			draggable : true,
			position : (event.latLng)
		})

		maker.addListener('click', function() {
			infoWindowMaker.open(map, this);
		});

		maker.addListener('dblclick', function() {
			maker.setMap(null)
			maker = null
		});

		geocoder.geocode({
			'latLng' : maker.getPosition()
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
					    		var button = document.createElement("BUTTON");
					    		var buttonText = document.createTextNode("gerar Relarótio");
					    		button.setAttribute("class", "btn btn-danger pull-right");
					    		
					    		button.appendChild(buttonText);
					    		divWithin.appendChild(button);
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
					    			
					    				
					    				
					    				infoWindowMaker.setContent(divWithin);
					    				infoWindowMaker.open(map, maker);
					    				var source = "<head><style>table {    font-family: arial, sans-serif; border:3;   border-collapse: collapse;    width: 100%;}td, th {    border: 1px solid #dddddd;    text-align: left;    padding: 8px;}tr:nth-child(even) {    background-color: #dddddd;}</style></head><body> <div id='testePDFJS'>	   		<tr>  			<th>Origem:"+result.mAssaltos[0].municipio+"</th>  		</tr>  <tr>	<th>ano</th>    <th>Total de assassinatos: </th>    <th>Quantidade de mulheres: </th>    <th>Quantidade de homens: </th>    <th>Homicídios: </th>    <th>Quantidade de latrocínios:</th>    <th>Quantidade de lesado ou morte:</th>    <th>Quantidade por arma bmAnca:</th>    <th>Quantiade por arma de fogo:</th>    <th>Assassinado(a) com idade até 12 anos:</th>    <th>Assassinado(a) com idade entre 13 e 17 anos:</th>    <th>Assassinado(a) com idade entre 18 e 30 anos:</th>    <th>Assassinado(a) com idade entre 31 e 65 anos:</th>    <th>Assassinado(a) com idade acima de 65 anos:</th>  </tr>  <tr>	<th>"+result.mAssassinatos[0].ano+"</th>  	<th>"+result.mAssassinatos[0].totalAssassinatos+"</th>  	<th>"+result.mAssassinatos[0].quatidadeMulher+"</th>  	<th>"+result.mAssassinatos[0].quantidadeHomem+"</th>  	<th>"+result.mAssassinatos[0].quantidadeHomicidio+"</th>  	<th>"+result.mAssassinatos[0].quantidadeLatrocinio+"</th>  	<th>"+result.mAssassinatos[0].quantidadeLesadoMorte+"</th>  	<th>"+result.mAssassinatos[0].quantidadeArmabmAnca+"</th>  	<th>"+result.mAssassinatos[0].quantidadeArmafogo+"</th>  	<th>"+result.mAssassinatos[0].idadeAte12+"</th>  	<th>"+result.mAssassinatos[0].idade13a17+"</th>  	<th>"+result.mAssassinatos[0].idade18a30+"</th>  	<th>"+result.mAssassinatos[0].idade31a65+"</th>  	<th>"+result.mAssassinatos[0].idadeAcima65+"</th>  </tr>  <tr>  	<th>"+result.mAssassinatos[0].ano+"</th>  	<th>"+result.mAssassinatos[0].totalAssassinatos+"</th>  	<th>"+result.mAssassinatos[0].quatidadeMulher+"</th>  	<th>"+result.mAssassinatos[0].quantidadeHomem+"</th>  	<th>"+result.mAssassinatos[0].quantidadeHomicidio+"</th>  	<th>"+result.mAssassinatos[0].quantidadeLatrocinio+"</th>  	<th>"+result.mAssassinatos[0].quantidadeLesadoMorte+"</th>  	<th>"+result.mAssassinatos[0].quantidadeArmabmAnca+"</th>  	<th>"+result.mAssassinatos[0].quantidadeArmafogo+"</th>  	<th>"+result.mAssassinatos[0].idadeAte12+"</th>  	<th>"+result.mAssassinatos[0].idade13a17+"</th>  	<th>"+result.mAssassinatos[0].idade18a30+"</th>  	<th>"+result.mAssassinatos[0].idade31a65+"</th>  	<th>"+result.mAssassinatos[0].idadeAcima65+"</th>  </tr>  <tr>	<th>"+result.mAssassinatos[0].ano+"</th>	<th>"+result.mAssassinatos[0].totalAssassinatos+"</th>	<th>"+result.mAssassinatos[0].quatidadeMulher+"</th>	<th>"+result.mAssassinatos[0].quantidadeHomem+"</th>	<th>"+result.mAssassinatos[0].quantidadeHomicidio+"</th>	<th>"+result.mAssassinatos[0].quantidadeLatrocinio+"</th>	<th>"+result.mAssassinatos[0].quantidadeLesadoMorte+"</th>	<th>"+result.mAssassinatos[0].quantidadeArmabmAnca+"</th>	<th>"+result.mAssassinatos[0].quantidadeArmafogo+"</th>	<th>"+result.mAssassinatos[0].idadeAte12+"</th>	<th>"+result.mAssassinatos[0].idade13a17+"</th>	<th>"+result.mAssassinatos[0].idade18a30+"</th>	<th>"+result.mAssassinatos[0].idade31a65+"</th>	<th>"+result.mAssassinatos[0].idadeAcima65+"</th>  </tr>		<tr>		  <th>Origem: "+result.mAssaltos[0].municipio+"</th>		  <th>Data do ocorrente: 2015</th><br>		</tr>	      	<tr>	  <th>Ano</th>	  <th>Total de assaltos: </th>	  <th>Roubo tmAnsuente: </th>	  <th>Roubo de veículo: </th>	  <th>Roubo por extorsão: </th>	  <th>Roubo a instituição financeimA:</th>	  <th>Roubo a carga:</th>	  <th>Roubo a motocicletas:</th>	  <th>Roubo a ônibus:</th>	  <th>Roubo a residências:</th>	  <th>Roubo a estabelecimentos:</th>	</tr>    	<tr>  	  <th>"+result.mAssaltos[0].ano+"</th>	  <th>"+result.mAssaltos[0].totalAssaltos+"</th>	  <th>"+result.mAssaltos[0].rouboTmAnseunte+"</th>	  <th>"+result.mAssaltos[0].rouboVeiculo+"</th>	  <th>"+result.mAssaltos[0].rouboExtorsao+"</th>	  <th>"+result.mAssaltos[0].rouboInstFinanc+"</th>	  <th>"+result.mAssaltos[0].rouboCarga+"</th>	  <th>"+result.mAssaltos[0].rouboMotoneta+"</th>	  <th>"+result.mAssaltos[0].rouboOnibus+"</th>	  <th>"+result.mAssaltos[0].rouboResidencias+"</th>	  <th>"+result.mAssaltos[0].rouboEstabelecimento+"</th>  	</tr>  	<tr>  		<th>"+result.mAssaltos[1].totalAssaltos+"</th>		<th>"+result.mAssaltos[1].rouboTmAnseunte+"</th>		<th>"+result.mAssaltos[1].rouboVeiculo+"</th>		<th>"+result.mAssaltos[1].rouboExtorsao+"</th>		<th>"+result.mAssaltos[1].rouboInstFinanc+"</th>		<th>"+result.mAssaltos[1].rouboCarga+"</th>		<th>"+result.mAssaltos[1].rouboMotoneta+"</th>		<th>"+result.mAssaltos[1].rouboOnibus+"</th>		<th>"+result.mAssaltos[1].rouboResidencias+"</th>		<th>"+result.mAssaltos[1].rouboEstabelecimento+"</th>  	</tr>  	<tr>  		<th>"+result.mAssaltos[2].totalAssaltos+"</th>		<th>"+result.mAssaltos[2].rouboTmAnseunte+"</th>		<th>"+result.mAssaltos[2].rouboVeiculo+"</th>		<th>"+result.mAssaltos[2].rouboExtorsao+"</th>		<th>"+result.mAssaltos[2].rouboInstFinanc+"</th>		<th>"+result.mAssaltos[2].rouboCarga+"</th>		<th>"+result.mAssaltos[2].rouboMotoneta+"</th>		<th>"+result.mAssaltos[2].rouboOnibus+"</th>		<th>"+result.mAssaltos[2].rouboResidencias+"</th>		<th>"+result.mAssaltos[2].rouboEstabelecimento+"</th>  	</tr>  </table></body></di>";
					    				var divRelatorio = document.createElement("div");
					    				divRelatorio.innerHTML = source;
					    				button.setAttribute("onclick", gerarRelatorio(divRelatorio.innerHTML));


                                        

                                        
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
					    		var button = document.createElement("BUTTON");
					    		var buttonText = document.createTextNode("gerar Relarótio");
					    		button.setAttribute("class", "btn btn-danger pull-right");
					    		
					    		
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
					    			}); infoWindowMaker.setContent(document.getElementById(id.length));
					    				infoWindowMaker.open(map, marker);
                                        
					    				var source = '<html><style>table {    font-family: arial, sans-serif;    border-collapse: collapse;    width: 100%;}td, th {    border: 1px solid #dddddd;    text-align: left;    padding: 8px;}tr:nth-child(even) {    background-color: #dddddd;}</style></head><body> <div id="testePDFJS"><table>	 <table>  		<tr>  			<th>Origem:"+result.rAssaltos[0].municipio+"</th>  		</tr>  <tr>	<th>ano</th>    <th>Total de assassinatos: </th>    <th>Quantidade de mulheres: </th>    <th>Quantidade de homens: </th>    <th>Homicídios: </th>    <th>Quantidade de latrocínios:</th>    <th>Quantidade de lesado ou morte:</th>    <th>Quantidade por arma branca:</th>    <th>Quantiade por arma de fogo:</th>    <th>Assassinado(a) com idade até 12 anos:</th>    <th>Assassinado(a) com idade entre 13 e 17 anos:</th>    <th>Assassinado(a) com idade entre 18 e 30 anos:</th>    <th>Assassinado(a) com idade entre 31 e 65 anos:</th>    <th>Assassinado(a) com idade acima de 65 anos:</th>  </tr>  <tr>	<th>"+result.rAssassinatos[0].ano+"</th>  	<th>"+result.rAssassinatos[0].totalAssassinatos+"</th>  	<th>"+result.rAssassinatos[0].quatidadeMulher+"</th>  	<th>"+result.rAssassinatos[0].quantidadeHomem+"</th>  	<th>"+result.rAssassinatos[0].quantidadeHomicidio+"</th>  	<th>"+result.rAssassinatos[0].quantidadeLatrocinio+"</th>  	<th>"+result.rAssassinatos[0].quantidadeLesadoMorte+"</th>  	<th>"+result.rAssassinatos[0].quantidadeArmabranca+"</th>  	<th>"+result.rAssassinatos[0].quantidadeArmafogo+"</th>  	<th>"+result.rAssassinatos[0].idadeAte12+"</th>  	<th>"+result.rAssassinatos[0].idade13a17+"</th>  	<th>"+result.rAssassinatos[0].idade18a30+"</th>  	<th>"+result.rAssassinatos[0].idade31a65+"</th>  	<th>"+result.rAssassinatos[0].idadeAcima65+"</th>  </tr>  <tr>  	<th>"+result.rAssassinatos[0].ano+"</th>  	<th>"+result.rAssassinatos[0].totalAssassinatos+"</th>  	<th>"+result.rAssassinatos[0].quatidadeMulher+"</th>  	<th>"+result.rAssassinatos[0].quantidadeHomem+"</th>  	<th>"+result.rAssassinatos[0].quantidadeHomicidio+"</th>  	<th>"+result.rAssassinatos[0].quantidadeLatrocinio+"</th>  	<th>"+result.rAssassinatos[0].quantidadeLesadoMorte+"</th>  	<th>"+result.rAssassinatos[0].quantidadeArmabranca+"</th>  	<th>"+result.rAssassinatos[0].quantidadeArmafogo+"</th>  	<th>"+result.rAssassinatos[0].idadeAte12+"</th>  	<th>"+result.rAssassinatos[0].idade13a17+"</th>  	<th>"+result.rAssassinatos[0].idade18a30+"</th>  	<th>"+result.rAssassinatos[0].idade31a65+"</th>  	<th>"+result.rAssassinatos[0].idadeAcima65+"</th>  </tr>  <tr>	<th>"+result.rAssassinatos[0].ano+"</th>	<th>"+result.rAssassinatos[0].totalAssassinatos+"</th>	<th>"+result.rAssassinatos[0].quatidadeMulher+"</th>	<th>"+result.rAssassinatos[0].quantidadeHomem+"</th>	<th>"+result.rAssassinatos[0].quantidadeHomicidio+"</th>	<th>"+result.rAssassinatos[0].quantidadeLatrocinio+"</th>	<th>"+result.rAssassinatos[0].quantidadeLesadoMorte+"</th>	<th>"+result.rAssassinatos[0].quantidadeArmabranca+"</th>	<th>"+result.rAssassinatos[0].quantidadeArmafogo+"</th>	<th>"+result.rAssassinatos[0].idadeAte12+"</th>	<th>"+result.rAssassinatos[0].idade13a17+"</th>	<th>"+result.rAssassinatos[0].idade18a30+"</th>	<th>"+result.rAssassinatos[0].idade31a65+"</th>	<th>"+result.rAssassinatos[0].idadeAcima65+"</th>  </tr></table>	<table>	<tr>		  <th>Origem: "+result.rAssaltos[0].municipio+"</th>		  <th>Data do ocorrente: 2015</th><br>		</tr>	      	<tr>	  <th>Ano</th>	  <th>Total de assaltos: </th>	  <th>Roubo transuente: </th>	  <th>Roubo de veículo: </th>	  <th>Roubo por extorsão: </th>	  <th>Roubo a instituição financeira:</th>	  <th>Roubo a carga:</th>	  <th>Roubo a motocicletas:</th>	  <th>Roubo a ônibus:</th>	  <th>Roubo a residências:</th>	  <th>Roubo a estabelecimentos:</th>	</tr>    	<tr>  	  <th>"+result.rAssaltos[0].ano+"</th>	  <th>"+result.rAssaltos[0].totalAssaltos+"</th>	  <th>"+result.rAssaltos[0].rouboTranseunte+"</th>	  <th>"+result.rAssaltos[0].rouboVeiculo+"</th>	  <th>"+result.rAssaltos[0].rouboExtorsao+"</th>	  <th>"+result.rAssaltos[0].rouboInstFinanc+"</th>	  <th>"+result.rAssaltos[0].rouboCarga+"</th>	  <th>"+result.rAssaltos[0].rouboMotoneta+"</th>	  <th>"+result.rAssaltos[0].rouboOnibus+"</th>	  <th>"+result.rAssaltos[0].rouboResidencias+"</th>	  <th>"+result.rAssaltos[0].rouboEstabelecimento+"</th>  	</tr>  	<tr>  		<th>"+result.rAssaltos[1].totalAssaltos+"</th>		<th>"+result.rAssaltos[1].rouboTranseunte+"</th>		<th>"+result.rAssaltos[1].rouboVeiculo+"</th>		<th>"+result.rAssaltos[1].rouboExtorsao+"</th>		<th>"+result.rAssaltos[1].rouboInstFinanc+"</th>		<th>"+result.rAssaltos[1].rouboCarga+"</th>		<th>"+result.rAssaltos[1].rouboMotoneta+"</th>		<th>"+result.rAssaltos[1].rouboOnibus+"</th>		<th>"+result.rAssaltos[1].rouboResidencias+"</th>		<th>"+result.rAssaltos[1].rouboEstabelecimento+"</th>  	</tr>  	<tr>  		<th>"+result.rAssaltos[2].totalAssaltos+"</th>		<th>"+result.rAssaltos[2].rouboTranseunte+"</th>		<th>"+result.rAssaltos[2].rouboVeiculo+"</th>		<th>"+result.rAssaltos[2].rouboExtorsao+"</th>		<th>"+result.rAssaltos[2].rouboInstFinanc+"</th>		<th>"+result.rAssaltos[2].rouboCarga+"</th>		<th>"+result.rAssaltos[2].rouboMotoneta+"</th>		<th>"+result.rAssaltos[2].rouboOnibus+"</th>		<th>"+result.rAssaltos[2].rouboResidencias+"</th>		<th>"+result.rAssaltos[2].rouboEstabelecimento+"</th>  	</tr>  </table></table></div></body></html>';
                                       
					    				button.setAttribute("onclick", gerarRelatorio(source));

					    	});
							
						}
						
					} else {
						infoWindowMaker.setContent("Dados não disponíveis em: "+results[0].address_components[indexState].short_name
								+"<br />"+results[0].formatted_address);
						infoWindowMaker.open(map, maker);
					}
				}
			}	
		})

		maker.addListener('dragend', function() {

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
					    		div.appendChild(canvas);
					            var id = document.getElementsByTagName("canvas");
					    		canvas.setAttribute("id", id.length);
					    		var ctx = document.getElementById(id.length);
					    		var button = document.createElement("button");
					    		button.innerHTML = "gerar Relatório";
					    		
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
					    			}); ctx.appendChild(button);
					    				infoWindowMaker.setContent(document.getElementById(id.length));
					    				infoWindowMaker.open(map, marker);

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
					    		div.appendChild(canvas);
					            var id = document.getElementsByTagName("canvas");
					    		canvas.setAttribute("id", id.length);
					    		var ctx = document.getElementById(id.length);
					    		
					    		
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
					    			}); infoWindowMaker.setContent(document.getElementById(id.length));
					    				infoWindowMaker.open(map, marker);

					    	});
							
						}
						} else {
							infoWindowMaker.setContent("Dados não disponíveis em: "+results[0].address_components[indexState].short_name
									+"<br />"+results[0].formatted_address);
							infoWindowMaker.open(map, marker);
						}
					}
				}
			}); 
		}); makers.push(maker); infoWindows.push(infoWindowMaker); infoWindowMaker.id = infoWindows.length;

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
                                        } alert(regioes[i][j]);
                                    }
                                    if(typeof ositionMesorregiao !== "undefined"){break;}
                                }
                                mesorregiao = arrayMesorregiaos[positionMesorregiao];
                                
                                alert(mesorregiao);
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
    					    		div.appendChild(canvas);
    					            var id = document.getElementsByTagName("canvas");
    					    		canvas.setAttribute("id", id.length);
    					    		var ctx = document.getElementById(id.length);
    					    		
    					    		
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
    					    			}); infoWindowLocalizacao.setContent(document.getElementById(id.length));
    					    			infoWindowLocalizacao.open(map, marker);


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
    					    		div.appendChild(canvas);
    					            var id = document.getElementsByTagName("canvas");
    					    		canvas.setAttribute("id", id.length);
    					    		var ctx = document.getElementById(id.length);
    					    		
    					    		
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
    					    			}); infoWindowLocalizacao.setContent(document.getElementById(id.length));
    					    			infoWindowLocalizacao.open(map, marker);

    					    	});
    							
    						}
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
    
    function gerarRelatorio(source) {
var pdf = new jsPDF('p', 'pt', 'letter');

specialElementHandlers = {
	'#bypassme': function(element, renderer){
		return true ;
	}
}
margins = {
    top: 50,
    left: 60,
    width: 545
  };
pdf.fromHTML(
  	source // HTML string or DOM elem ref.
  	, margins.left // x coord
  	, margins.top // y coord
  	, {
  		'width': margins.width // max width of content on PDF
  		, 'elementHandlers': specialElementHandlers
  	},
  	function (dispose) {
  	  // dispose: object with X, Y of the last line add to the PDF
  	  //          this allow the insertion of new lines after html
        pdf.save('Relatorio De Municipios.pdf');
      }
  )		
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAU4tZgF7qKxiAMdKz8j0Pa3_TVyNdZgjM&callback=initMap"></script>   
