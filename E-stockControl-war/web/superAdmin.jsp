<%-- 
    Document   : superAdmin
    Created on : Sep 18, 2011, 11:06:37 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>superAdmin</title>
    <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%


 String usernamer = "";
        try{

     usernamer = session.getAttribute("usernamer").toString();

        }catch(Exception ex){
      response.sendRedirect("superControl.jsp");
        }
        %>
     <form action="" method="post">
       <table width="67%" border="0" align="center"  cellpadding="0" cellspacing="0">
         <tr>
           <td width="14%">&nbsp;</td>
           <td width="15%">&nbsp;</td>
           <td width="22%">&nbsp;</td>
           <td width="39%">&nbsp;</td>
           <td width="10%">&nbsp;</td>
         </tr>
         <tr class="tableheader1">
           <td height="23"><a href="addSockAndInventoryEdition.jsp"><img src="images/Import Document.png" width="32" height="32"></a></td>
           <td><a href="supAddBranch.jsp"><img src="images/Add.png"/></a></td>
           <td><a href="supAddWarehouse.jsp"><img src="images/Add Green Button.png" width="32" height="32"></a></td>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
         <tr class="tableheader">
           <td height="36"><a href="addSockAndInventoryEdition.jsp">set  Edition</a></td>
           <td><a href="supAddBranch.jsp">Add Branch</a></td>
           <td><a href="supAddWarehouse.jsp">Add Warehouse</a></td>
           <td><a href="supperAdminCreateAdmin.jsp">Create User</a> </td>
           <td><a href="superControl.jsp">Logout</a></td>
         </tr>
         <tr>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
         </tr>
       </table>
     </form>
    </body>
</html>
