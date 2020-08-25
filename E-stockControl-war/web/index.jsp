<%-- 
    Document   : index
    Created on : Jun 7, 2011, 2:10:34 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
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
          <script src="../Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>
    <body>
    <table width="83%" border="0" align="center" cellpadding="0" cellspacing="0" class="table_head">
  <tr>
      <td  ><p>Stock &amp; Inventory Control System </p>
      </td>
    </tr>
</table>
    <table width="83%" border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
                <td width="36%">&nbsp;</td>
                <td width="50%">&nbsp;</td>
      <td width="14%">&nbsp;</td>
      </tr>
            <tr>
                <td valign="top"><img src="images/iStock_Inventory_Global_mouse-XSmall-resized-600.jpg.png" width="347" height="346"></td>
                <td valign="top">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"></noscript>
      <img src="images/Corbis-42-23655473.jpg" width="370" height="200"></td>
  </tr>
  <tr>
    <td><strong>Stock Management Features</strong></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> <ul style="color:#996633" >
                  <li>Stock Take Management</li>
                  <li>Stock Transfers</li>
               <li>Comprehensive Stock History</li>
             		<li>Multiple Warehouses</li>
               <li>Minimum Stock Levels</li>
               </ul></td>
    <td> <ul style="color:#996633">
                  <li>Dynamically Generate Stock list</li>
                     <li>Stock Reports</li>
             		<li>------</li>
               <li>-----</li>
          </ul></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table></td>
                <td valign="top"><table >
                  <tr>
                    <td width="94"><a href="javascript:void(0);" onClick="window.open('login.jsp');"><img src="images/images.jpg" alt="loading image..." ></a></td>
                  </tr>
                  <tr>
                    <td></td>
                  </tr> 
                </table>               </td>
      </tr>
    </table>
    <table width="83%" border="0" align="center" cellpadding="0" cellspacing="0" class="footer" >
      <tr>
        <td width="30%">&nbsp;</td>
        <td width="36%">&nbsp;</td>
        <td width="34%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><div align="center"><font  color="#FFFFFF">powered By Sliftsoft</font></div></td>
        <td >&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
</body>
</html>
