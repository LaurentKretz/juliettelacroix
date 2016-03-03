$('.star input').on('click', function() {
  var gradeId = $(this).parents(".star").data('grade-id');
  var perfumeId = $(this).parents(".review").data('perfume-id');
  var reviewId = $(this).parents(".review").data('review-id');
  var gradeValue = $(this).val();
  if (reviewId != "nil") {
    $.ajax({
      type: "put",
      url: "/account/perfumes/" + perfumeId + "/reviews/" + reviewId + "?grade=" + gradeId + '&value=' + gradeValue
    });
  } else {
    $.post( "/account/perfumes/" + perfumeId + "/reviews/?grade=" + gradeId + '&value=' + gradeValue);
  }
})

// $('#comment').on('click', function() {
//   // expend frame
//   // show previous comment
//   })
// })

$('#comment_input').on('keyup', function(event) {
  if(event.which == 13 && event.shiftKey){
    $('#comment_form').submit();
  };
});

