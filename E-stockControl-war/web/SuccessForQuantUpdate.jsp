<%-- 
    Document   : SuccessForQuantUpdate
    Created on : Feb 21, 2012, 12:51:39 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>success</title>
	<link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%
        try{
            String sss = session.getAttribute("ccode").toString();
           //quant = null;

            System.out.println("na so we go de dey---------- not straight" +sss);
           hs = scl.viewSingleCommodity(sss, whcode);
            Integer quant = hs.getQuantityIn();
        %>
<table width="80%" border="0" cellspacing="0" cellpadding="0" class="even">
  <tr>
    <td width="28%" height="55">&nbsp;</td>
    <td width="29%">Done Successfuly !! your new Quantity is </td>
    <td width="43%"><%=quant%></td>
  </tr>
  <tr>
    <td height="15">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

    </body>
</html>
<%
}catch(Exception ex){
System.out.println();
}
%>