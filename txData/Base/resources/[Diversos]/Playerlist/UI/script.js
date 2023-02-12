window.addEventListener("message", function (event) {
    const data = event.data;
    if (data.show) {
        $(".main").fadeIn();
        if (data.inService) {
            this.document.getElementById("playerStatus").innerHTML = "Em serviço";
        } else {
            this.document.getElementById("playerStatus").innerHTML = "Fora de serviço";
        }
        this.document.getElementById("players").innerHTML = data.total;
        const police = this.document.getElementById("police");
        const ambulance = this.document.getElementById("ambulance");
        if (data.police > 0) {
            police.innerHTML = "ON";
            police.style.color = "green";
        } else {
            police.innerHTML = "OFF";
            police.style.color = "red";
        }
        if (data.ambulance > 0) {
            ambulance.innerHTML = "ON";
            ambulance.style.color = "green";
        } else {
            ambulance.innerHTML = "OFF";
            ambulance.style.color = "red";
        }
    } else {
        $(".main").fadeOut();
    }
});