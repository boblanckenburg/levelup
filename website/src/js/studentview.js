
function init_progressbar()
{
	var progress_fill_element = document.getElementById("levelcounter_progressbar");
	var percentage_element = document.getElementById("levelcounter_percentage");
	progress_fill_element.style.width = percentage_element.innerHTML + "%";
}

function init_emblem()
{
	var background_url = document.getElementById("levelcounter_imageurl").innerHTML + ".png";
	document.getElementById("levelcounter_image").style.backgroundImage = "url('"+background_url+"')";
	document.getElementById("levelcounter_image").onmouseover = emblem_hover;
	document.getElementById("levelcounter_image").onmouseout = init_emblem;
}

function emblem_hover()
{
	var background_url = document.getElementById("levelcounter_imageurl").innerHTML + "-MouseOver.png";
	document.getElementById("levelcounter_image").style.backgroundImage = "url("+background_url+")";
}

window.onload = function()
{
	init_progressbar();
	init_emblem();
};
