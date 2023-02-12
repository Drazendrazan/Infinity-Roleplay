$(function() {
 window.addEventListener('message', function(event) {
  var data = event.data;
  if (data.type == "showAxon") {
   $("body").fadeIn(500);
   if (data.showTime) {
    if (data.useRealtime) {
     var convertedTime = moment.tz(moment(), data.useTimezone).format('HH:mm')
     $("#text").html("BODYCAM FEED - " + convertedTime + "<br>" + data.name);
    } else {
     $("#text").html("BODYCAM FEED - " + data.time + "<br>" + data.name);
    }
   } else {
    $("#text").html("BODYCAM FEED<br>" + data.name);
   }
   $("#ui").show();
  } else { 
   $("body").fadeOut(500);
  }
 });
});
