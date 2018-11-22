$( document ).ready(function() {
  $(".notification").click(function() {
    $.ajax({
      url: "/notifications/seen",
      method: "PATCH"
    }).done(function(data) {
      console.log(data['success']);
    });
  })
})
