function gerarGrafico(dados) {
	
	$.post("/PP2-DangerousPlace/dadosMuncipios", {'data':dados}, function(result){
		console.log(result);
	});

/*var color = Chart.helpers.color;
		var barChartData = {
			labels: ['2015', '2016', '2017', '2018'],
			datasets: [{
				label: 'Dataset 1',
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
				label: 'Dataset 2',
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
				label: 'Dataset 3',
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

		window.onload = function() {
			var ctx = document.getElementById('canvas');
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
			});

		};*/
		
};