

function updateStudent(name,date,checkboxname)
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
					xmlHttpFinishedCallback();
				}
				
				else
				{
					document.getElementById("serverresponse").innerHTML = "Saving failed!";
				}
			}
		};
		
		xmlhttp.open("GET", "index.php?page=docentview&name="+name+"&date="+date+"&presence="+$("#"+checkboxname).prop('checked'), true);
		xmlhttp.send();
	}
}



function updateStudent(name,date,checkboxname)
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
					xmlHttpFinishedCallback();
				}
				
				else
				{
					document.getElementById("serverresponse").innerHTML = "Saving failed!";
				}
			}
		};
		
		xmlhttp.open("GET", "index.php?page=docentview&name="+name+"&date="+date+"&presence="+$("#"+checkboxname).prop('checked'), true);
		xmlhttp.send();
	}
}
