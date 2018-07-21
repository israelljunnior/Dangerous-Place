var map;
    var geocoder; 
    var infoWindow;
    var markison;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -8.34551115, lng: -35.23796773},
          zoom: 8
        });
        
        infoWindow = new google.maps.InfoWindow();
        geocoder = new google.maps.Geocoder();
        
        google.maps.event.addListener(map, 'click', function (event){ 
          
          if(markison != null ){
            markison.setMap(null)
            markison = null
          }
          markison = new google.maps.Marker({
              map: map,
              draggable: true,
              position:(event.latLng)
          })

          markison.addListener('click', function () {
              infoWindow.open(map, this);
          });

          markison.addListener('dblclick', function(){
            markison.setMap(null)
            markison = null
          });
          
          geocoder.geocode({'latLng': markison.getPosition()}, function (results, status){
            if(status == google.maps.GeocoderStatus.OK)
              if(results[0])
                infoWindow.setContent(results[0].formatted_address);
                infoWindow.open(map, markison);
          })

          markison.addListener('dragend', function() {
            
            geocoder.geocode({'latLng': markison.getPosition()}, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]){
                  infoWindow.setContent(results[0].formatted_address);  
                  infoWindow.open(map, markison);
                  }
                }
              });
            });

          });

      };