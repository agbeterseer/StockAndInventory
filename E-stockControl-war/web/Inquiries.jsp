<%-- 
    Document   : Inquiries
    Created on : Oct 4, 2011, 9:06:46 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inquiries</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
    </head>
    <body>
        <%
        String movee = request.getParameter("movee");
        String usage = request.getParameter("usage");
        String statuss = request.getParameter("statuss");
        try{

            if(request.getParameter("movee") !=null){
                
                response.sendRedirect("InventoryMovements.jsp");

            }
             if(request.getParameter("usage") !=null){

                 response.sendRedirect("InventoryUsageinquiries.jsp");
            }
             if(request.getParameter("statuss") !=null){

                 response.sendRedirect("InventoryInquiries.jsp");
            }
        }catch(Exception ex){
        System.out.println();

        }


            %>
    <form name="" action="" method="post">
 <table width="70%" border="0" cellspacing="0" cellpadding="0"  >
  <tr>
    <td width="29%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
    <td width="38%">&nbsp;</td>
  </tr>
  <tr>
    <td height="26"><input name="statuss" type="submit" class="bot" value="Inventory Status inquiries"></td>
    <td><input name="movee" type="submit" class="bot" value="Inventory Movement inquiries"></td>
    <td><input name="usage" type="submit" class="bot" value="Inventory Usage inquiries"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
    </body>
</html>
