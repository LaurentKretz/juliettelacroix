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
