<%-- 
    Document   : addItems
    Created on : Oct 11, 2011, 9:50:26 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addItems</title>
        <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
    </head>
    <body>
        <%

        try{%>
         <%
        String Produced = request.getParameter("Produced");
        String Bought = request.getParameter("Bought");
 

            if(Produced !=null){
                response.sendRedirect("vPro.jsp");
           }
            if(Bought !=null){
              response.sendRedirect("viewItemsBought.jsp");

            }
       //System.out.println("edition==" +session.getAttribute("edition").toString());
          %>

<% if(CONFIG.getSYSTEM_EDITION_CompanyEdition().equalsIgnoreCase(session.getAttribute("edition").toString())){ %>
<form action="" method="post"><table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr >
    <td width="36%">&nbsp;</td>
    <td width="43%">&nbsp;</td>
    <td width="21%">&nbsp;</td>
  </tr>
  <tr>
    <td height="30" align="center"> <input type="submit" name="Produced" id="Produced" value="Add Items Produced" class="bot"></td>
    <td align="center">    <input type="submit" name="Bought" id="Bought" value="Add Items Bought" class="bot"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<%}%>
    </body>
</html>
<%
}catch(Exception ex){
  response.sendRedirect("errorpage.jsp");
}

%>