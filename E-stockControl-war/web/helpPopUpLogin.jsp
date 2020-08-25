<%-- 
    Document   : helpPopUpLogin
    Created on : Jun 15, 2011, 9:46:03 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home page</title>
         <script type="text/javascript">
<!--
// by Nannette Thacker
// http://www.shiningstar.net
// This script checks and unchecks boxes on a form
// Checks and unchecks unlimited number in the group...
// Pass the Checkbox group name...
// call buttons as so:
// <input type=button name="CheckAll"   value="Check All"
	//onClick="checkAll(document.myform.list)">
// <input type=button name="UnCheckAll" value="Uncheck All"
	//onClick="uncheckAll(document.myform.list)">
// -->


function checkAll(field)
{
for (i = 0; i < field.length; i++)
	field[i].checked = true ;
}
function ShowContactInfo(url,id,w) {
		var newWindow = window.open(url+".jsp?cid="+id,"Details","width="+w+",height=600,scrollbars=1");
	}

function uncheckAll(field)
{
for (i = 0; i < field.length; i++)
	field[i].checked = false ;
}

	function popWindow(url,w) {
		var newWindow = window.open(url+".jsp","New","width="+w+",height=400,scrollbars=1");
	}

    function openWindow(){
	var url = "login.jsp";
    var Print_win = window.open(url,"Print_win","menubar=yes, resizable=yes, width=3000,height=1000,top=0,left=0");
		Print_win.focus();
}
        </script>
    </head>
    <body  onload="openWindow()">
  
    </body>
</html>
