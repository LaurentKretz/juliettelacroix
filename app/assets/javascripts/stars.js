$('.star input').on('click', function() {
  var gradeId = $(this).parents(".star").data('grade-id');
  var perfumeId = $(this).parents(".review").data('perfume-id');
  var reviewId = $(this).parents(".review").data('review-id');
  var gradeValue = $(this).val();
  if (reviewId != "nil") {
    $.post( "/account/perfumes/" + perfumeId + "/reviews/" + reviewId + "/update?grade=" + gradeId + '&value=' + gradeValue , function( data ) {
    });
  } else {
    $.post( "/account/perfumes/" + perfumeId + "/reviews/?grade=" + gradeId + '&value=' + gradeValue , function( data ) {
    });
  }
})
