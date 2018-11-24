$( document ).ready(function() {
  $("#mark-all-as-read").click(function() {
    $.ajax({
      url: "/notifications/seen",
      method: "PATCH"
    }).done(function(data) {
      if(data['success']) {
        $("#notification").find('.badge').text(0);
        $("#notification").find('.dropdown-menu > li').addClass('read');
      }
    });
    $('#dropdownMenu').dropdown("toggle");
    return false;
  })
})
