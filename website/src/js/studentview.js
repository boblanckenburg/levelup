
function init_progressbar()
{
	var level = Math.floor( Math.random() * 10 );
	var percentage = Math.floor( Math.random() * 100 );
	
	var level_element = document.getElementById("levelcounter_level");
	var prevlvl_element = document.getElementById("levelcounter_prevlvl");
	var nextlvl_element = document.getElementById("levelcounter_nextlvl");
	var progress_fill_element = document.getElementById("levelcounter_progressbar");
	var percentage_element = document.getElementById("levelcounter_percentage");
	
	level_element.innerHTML = level;
	prevlvl_element.innerHTML = level+1;
	nextlvl_element.innerHTML = level;
	
	percentage_element.innerHTML = percentage + "%";
	progress_fill_element.style.width = percentage + "%";
}

window.onload = function() {
	init_progressbar();
}
