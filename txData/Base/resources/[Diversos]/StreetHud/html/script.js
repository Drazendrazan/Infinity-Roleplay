window.addEventListener('message', (event) => {
    const data = event.data;
    const streetname = document.getElementById("streetname");
    if (data.show) {
        streetname.innerHTML = data.street + " - " + data.compass + " (" + data.compassName + ")";
        streetname.style.visibility = "visible";
    } else {
        streetname.style.visibility = "hidden";
    }
});