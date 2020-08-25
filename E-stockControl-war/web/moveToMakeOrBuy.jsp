<%-- 
    Document   : moveToMakeOrBuy
    Created on : Oct 28, 2011, 10:28:39 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>moveToMakeOrBuy</title>
              <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
    </head>
    <body>

        <%
try{
            String code = request.getParameter("code");
          try{

    //list = scl.viewStoreByCategoryAndWareHouse(code, whcode);


         hsc =  scl.viewSingleCostMethode(valu);
         
      hcc = scl.viewSingleCategory(code);
         //  status = hsc.getStatus();
        //  list = scl.viewAllCategory();

           //costtype = hsc.getCostType();

      }catch(Exception ex){
      System.out.println();
       }

        %>
       <% if( sdd.getEditionName().equalsIgnoreCase(CONFIG.getSYSTEM_EDITION_OfficeEdition())){%>
       <form action="" method="post"><table width="10%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="16%">&nbsp;</td>
    <td width="84%">&nbsp;</td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td><a href="CostItemForBuy.jsp?code=<%=hcc.getCategorycode()%>"><img src="images/03.png" width="55" height="55"></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><a href="CostItemForBuy.jsp?code=<%=hcc.getCategorycode()%>">[Buy]</a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
       <%}%>
       <%if( sdd.getEditionName().equalsIgnoreCase(CONFIG.getSYSTEM_EDITION_CompanyEdition())){%>
<form action="" method="post"><table width="20%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="6%">&nbsp;</td>
    <td width="24%">&nbsp;</td>
    <td width="41%">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr>
    <td height="24">&nbsp;</td>
    <td><a href="CostItemForMake.jsp?code=<%=hcc.getCategorycode()%>"><img src="images/01.png" width="55" height="55"></a></td>
    <td>&nbsp;</td>
    <td><a href="CostItemForBuy.jsp?code=<%=hcc.getCategorycode()%>"><img src="images/03.png" width="55" height="55"></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="CostItemForMake.jsp?code=<%=hcc.getCategorycode()%>">[Make]</a></td>
    <td>&nbsp;</td>
    <td><a href="CostItemForBuy.jsp?code=<%=hcc.getCategorycode()%>">[Buy]</a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
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