function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  var place = this.getPlace();
  var street_number = "";
  var street_name = "";

  // console.log(place);  // Uncomment this line to view the full object returned by Google API.


  for (var i in place.address_components) {
    var component = place.address_components[i];

    for (var j in component.types) {  // Some types are ["country", "political"]
      var type  = component.types[j];
      var value = component.long_name;
      var type_element = $('.checkout-form [data-autocomplete="' + type + '"]');

      if (type == "country") {
        value = component.short_name;
        var option = $(type_element).find('option[value="' + value + '"]');
        $(option).prop('selected', true);
      }
      else if (type == "street_number" && value != undefined) {
        street_number = value;
      }
      else if (type == "route" && value != undefined) {
        street_name = value;
      }
      else {
        type_element.val(value);
      }
    }
  }

  $('.checkout-form [data-autocomplete="street"]').val(street_number + ' ' + street_name);
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('user_input_autocomplete_address');
});
