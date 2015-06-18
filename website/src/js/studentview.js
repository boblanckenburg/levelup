
function init_progressbar()
{
	var progress_fill_element = document.getElementById("levelcounter_progressbar");
	var percentage_element = document.getElementById("levelcounter_percentage");
	progress_fill_element.style.width = percentage_element.innerHTML + "%";
}

function init_emblem()
{
	var background_url = document.getElementById("levelcounter_image").innerHTML + ".png";
	alert( background_url );
	document.getElementById("levelcounter_image").css("background-image","url('"+background_url+"')");
}

function emblem_hover()
{
	document.getElementById("levelcounter_image").css("background-image","url("+background_url+")");
}

window.onload = function()
{
	init_progressbar();
	init_emblem();
};
