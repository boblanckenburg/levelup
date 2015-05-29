
function init_progressbar()
{
	var progress_fill_element = document.getElementById("levelcounter_progressbar");
	var percentage_element = document.getElementById("levelcounter_percentage");
	progress_fill_element.style.width = percentage_element.innerHTML + "%";
}

window.onload = function()
{
	init_progressbar();
}
