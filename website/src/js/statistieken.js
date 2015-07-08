
function create_emblem_hover(i)
{
	var background_urls = document.getElementsByClassName("levelcounter_imageurl");
	var url = background_urls[i].innerHTML;
	var levelcounter = document.getElementsByClassName("levelcounter_image")[i];
	return function()
	{
		var hover_url = url + "-MouseOver.png";
		levelcounter.style.backgroundImage = "url('"+hover_url+"')";
	};
}

function init_emblem()
{
	var background_urls = document.getElementsByClassName("levelcounter_imageurl");
	for( var i = 0; i < background_urls.length; i++ )
	{
		var url = background_urls[i].innerHTML;
		var img_url = url + ".png";
		var levelcounter = document.getElementsByClassName("levelcounter_image")[i];
		levelcounter.style.backgroundImage = "url('"+img_url+"')";
		levelcounter.onmouseover = create_emblem_hover(i);
		levelcounter.onmouseout = init_emblem;
	}
}

window.onload = function()
{
	init_emblem();
};
