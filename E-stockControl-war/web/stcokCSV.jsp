<%-- 
    Document   : stcokCSV
    Created on : Nov 13, 2011, 11:53:48 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock CSV</title>
      <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
 <table width="80%" border="0" cellspacing="3" cellpadding="0">
    <tr>
    <td valign="top"></td>
    <td valign="top"><form action="StockCSV" method="post" enctype="multipart/form-data" name="studcsv">
        <fieldset class="centercontent">
      <legend>Upload Stock CSV</legend>
      <table width="100%" border="0" cellspacing="3" cellpadding="0">
        <tr>
          <td align="right">File:</td>
          <td><label>
           <input name="csv" type="file" onblur="return checkExt2(this,'csv');" id="File Location">
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><label>
            <input type="submit" name="button" id="button"  class="bot"value="Upload CSV">
          </label></td>
        </tr>
      </table>
      </fieldset>
    </form></td>
  </tr>
</table>
    </body>
</html>
