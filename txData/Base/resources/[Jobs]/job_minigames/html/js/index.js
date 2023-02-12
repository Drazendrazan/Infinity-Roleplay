var value = 0;
var timer = 0;
var min = 0;
var max = 0;
var using = false;

$("#main").hide();
$(document).ready(function () {
    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.circle_minigame) {
            setTimeout(function(){ 
                using = true;
                UpdateBarValue(0);
                SetBackgroundValue(item.circle_minigame.background_width);
                $("#interact_bar").attr("transform","rotate("+item.circle_minigame.background_rotate+" 0 0)")
                min = item.circle_minigame.background_valid_min;
                max = item.circle_minigame.background_valid_max;
                timer = item.circle_minigame.time;
                value = 0;
    
                $("#main").show();
                $("#svg circle").css("transition","none")
                UpdateBarTimer(0)
                $("#svg circle").css("transition","stroke-dashoffset 0.05s linear")
            }, 100);
        }
        if (item.circle_minigame) {

        }
    });
    document.addEventListener("keydown", function onEvent(event) {
        if (event.key == "e" || event.key == "E") {
            using = false;
            $("#main").hide();
            if (value >= min && value <= max) {
                $.post('http://job_minigames/success', JSON.stringify({}));
            } 
            else {
                $.post('http://job_minigames/fail', JSON.stringify({}));
            }
        }
    });
});

function UpdateBarTimer(val) {
    if (using === true) {
        setTimeout(function(){ 
            value = val + 1;
            if (value < 100) {
                UpdateBarTimer(value);
                UpdateBarValue(value);
            } else {
                $.post('http://job_minigames/fail', JSON.stringify({}));
                $("#main").hide();
                using = false;
            }
        }, timer);
    }
}
function UpdateBarValue(val) {  
    if (val < 0) { val = 0;}
    if (val > 100) { val = 100;}
      
    var pct = ((100-val)/100)*565.4866776461628; 
    $('#svg #bar').css({ strokeDashoffset: pct});
    $('#cont').attr('data-pct',val);
}
function SetBackgroundValue(val) {
    if (val < 0) { val = 0;}
    if (val > 100) { val = 100;}
      
    var pct = ((100-val)/100)*565.4866776461628;
      
    $('#svg #interact_bar').css({ strokeDashoffset: pct});
    $('#cont').attr('data-pct',val);
}