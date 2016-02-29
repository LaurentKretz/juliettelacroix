$(document).ready(function() {


   $("#owl-demo").owlCarousel({

      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true,
      autoHeight : true,
      navigationText:  ["<",">"],
      addClassActive: true,
      // "singleItem:true" is a shortcut for:
      // items : 1,
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false
  });

  if (window.location.hash == "#last-card"){
    var owl = $("#owl-demo").data('owlCarousel');
    owl.jumpTo(6);
  }
});
