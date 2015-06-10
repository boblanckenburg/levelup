

function updateStudentHomework(name,inputname)
{
	url = window.location.href+"&homework="+$("#"+inputname).prop('value')+"&name="+name;
	sendXMLHttpRequest( url );
}

function updateStudentInactivity(name,checkboxname)
{
	url = window.location.href+"&inactive="+$("#"+checkboxname).prop('checked')+"&name="+name;
	sendXMLHttpRequest( url );
}

function updateStudentPresence(name,checkboxname,date)
{
	url = window.location.href+"&presence="+$("#"+checkboxname).prop('checked')+"&date="+date+"&name="+name;
	sendXMLHttpRequest( url );
}

function sendXMLHttpRequest( url )
{
	document.getElementById("serverresponse").innerHTML = "Save request sent!";

	if( window.XMLHttpRequest )
	{
		xmlhttp=new XMLHttpRequest();
	}
	
	if( xmlhttp )
	{
		xmlhttp.onreadystatechange=function()
		{
		    if(xmlhttp.readyState == 1)
		    {
					document.getElementById("serverresponse").innerHTML = "Status 1: Server connection established! ...";
		    }
		    
			else if(xmlhttp.readyState == 2)
			{
					document.getElementById("serverresponse").innerHTML = "Status 2: Request recieved! ...";
		    }
		    
			else if(xmlhttp.readyState == 3)
			{
					document.getElementById("serverresponse").innerHTML = "Status 3: Processing Request! ...";
		    }
		    
			else if( xmlhttp.readyState==4 )
			{
				if(xmlhttp.status==200)
				{
					document.getElementById("serverresponse").innerHTML = "Saving completed!";
				}
				
				else
				{
					document.getElementById("serverresponse").innerHTML = "Saving failed!";
				}
			}
		};

		xmlhttp.open("GET", url, true);
		xmlhttp.send();
	}
}

	