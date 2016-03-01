$(document).ready(function (){
  $("#down").click(function (){
    $('html, body').animate({
      scrollTop: $("#experience").offset().top
    }, 1000);
  });


  // <!-- Adjust video height and width -->
  //   var w = $(window).width(), h = $(window).height()
  //   $('#video-block video').css({height: ''+h+'',width: ''+w+''})
  //   $(window).resize(function(){
  //   var w = $(window).width(), h = $(window).height()
  //   $('#video-block video').css({height: ''+h+'',width: ''+w+''})
  //   })
});

$(document).ready(function() {

  var owl = $("#owl-hp");

  owl.owlCarousel({

      itemsCustom : [
        [0, 2],
        [450, 4],
        [600, 7],
        [700, 9],
        [1000, 10],
        [1200, 12],
        [1400, 13],
        [1600, 15]
      ],
      navigation : true

  });

});
