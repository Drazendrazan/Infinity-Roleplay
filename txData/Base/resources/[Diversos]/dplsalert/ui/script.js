window.addEventListener('message', function(event){
	var item = event.data;
	if (item.display) {
		document.getElementById('Alerta').style.visibility = 'visible';
	} else {
		document.getElementById('Alerta').style.visibility = 'hidden';
	}
});