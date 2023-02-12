$(function() {
 window.addEventListener('message', function(event) {
  var data = event.data;
  if (data.type == "showAxon") {
   $("body").fadeIn(500);
   
   $("#speed").html("GPS " + data.speed + " MPH");
   $("#license").html(data.plate);
   $("#model").html(data.model);
   $("#coords-x").html(data.position.x.toFixed(2));
   $("#coords-y").html(data.position.y.toFixed(2));

   if (data.braking) {
    $("#brake").addClass("active");
   } else {
    $("#brake").removeClass("active");
   }

   if (data.handbrake) {
    $("#handbrake").addClass("active");
   } else {
    $("#handbrake").removeClass("active");
   }
   
   if (data.lights) {
    $("#lights").addClass("active");
   } else {
    $("#lights").removeClass("active");
   }

   if (data.useRealtime) {
    var convertedTime = moment.tz(moment(), data.useTimezone).format('HH:mm')
    $("#time").html(convertedTime);
   } else {
    $("#time").html(data.gameTime);
   }
  } else { 
   $("body").fadeOut(500);
  }
 });
});
