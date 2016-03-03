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

// $('#comment').on('click', function() {
//   // expend frame
//   // show previous comment
//   })
// })

$('#comment').on('keyup', function(event) {
  if(event.which == 13 && event.shiftKey){
    // var perfumeId = $(this).closest(".abstract").data('perfume-id');
    // var reviewId = $(this).parents(".abstract").data('review-id');
    // console.log(perfumeId);
    // console.log(reviewId);
    // var comment = {
    //   "content": $(this).text(),
    //   "perfume_id": perfumeId,
    //   "id": reviewId,
    //   "review_id": reviewId
    // };
    // $.ajax({
    //   type: "PUT",
    //   url: "/account/perfumes/" + perfumeId+"/reviews/" + reviewId,
    //   data: comment,
    //   success: function(data) {
    //   console.log("Successfully created " + data.content);
    //   },
    // });
  submit
  }
});

