// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

(function(){
   var flashDurationInSeconds = 5;
   var flashContainerId = 'notice';

   function removeFlashMessages() {
     $('#' + flashContainerId).remove();
   }

   setTimeout(removeFlashMessages, flashDurationInSeconds * 1000);
}).call(this);

(function(){
   var flashDurationInSeconds = 5;
   var flashContainerId = 'alert';

   function removeFlashMessages() {
     $('#' + flashContainerId).remove();
   }

   setTimeout(removeFlashMessages, flashDurationInSeconds * 1000);
}).call(this);

(function() {
  $('#notifications').on("scroll", function() {             
     $('.notif').each(function () {
        if( $(this).next().offset() ) {
           console.log("current: " + $(this).offset().top);
           console.log("next: " + $(this).next().offset().top);
           if( $(this).offset().top <= $(this).next().offset().top ) {
              $(this).find( ".notif" ).css( "color", "red" );
              //return;
           }
        }
     });
  });
}).call(this);
