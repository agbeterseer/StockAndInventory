<%-- 
    Document   : addSockAndInventoryEdition
    Created on : Sep 18, 2011, 11:02:24 AM
    Author     : Terseer
--%>

<%@page import="javax.ejb.*,java.lang.*,javax.naming.InitialContext,javax.rmi.PortableRemoteObject,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="stockcontrolhelper.*"%>
<%@page import="stockcontrolsession.*"%>
<%@page import="Utill.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addSockAndInventoryEdition</title>
            <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
          <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
    <%
            SControlLocal scl = null;
            ReportsLocal rpl = null;
    %>
    <%
            LGAHelper lp = null;
            NationalityHelper np = null;
            StateHelper shh = null;
            String msg = "";
            String style = "";
            HelpProduction hpr = null;
            HelpStock hs = null;
            HelpSupply hsup = null;
            HelpLimit hp = null;
            Helpcommodity hhcc = null;
            HelpCostAnalysis hca = null;
            HelpSection hsec = null;
            HelpSection hss = null;
            staffHelper hstaff = null;
            StockEdtion stedi = null;
            helpwarehouse hew = null;
            helpStockTransfer trans = null;
            helpUits hu = null;
            HelpMaterials hmat = null;
            HelpRequisition hrp = null;
            HelpBranch hbb = null;
        %>
        <%
            try {
                InitialContext c = new InitialContext();
                SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
                scl = rv.create();
            } catch (Exception ne) {
                System.out.println();
            }

            ArrayList llist = new ArrayList();
        %>
        <%
        String inventoryedition = request.getParameter("inventoryedition");
        try{
            if(request.getParameter("addedtion") !=null){
           msg = scl.addStockInventoryEdition(new StockEdtion("", inventoryedition,""));
             style = "success";
           }
        }catch(Exception ex){
            style = "error";
        System.out.println();
        }
        %> <form action="" method="post">
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
<form action="" method="post" onsubmit="return validate(this);">
      <table width="67%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="19" colspan="3" class="<%=style%>"><%=msg%></td>
     </tr>
        <tr>
          <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
        <tr>
          <td class="tab_lebel">Inventory Editions</td>
      <td><label> 
        <select name="inventoryedition" id="inventoryedition">
          <option value="---Select one----">-------Select one------</option>
          <option value="Office Edition">Office Edition</option>
          <option value="Company Edition">Company Edition</option>
          <option value="Professional Edition">Professional Edition</option>
          </select>
        </label></td>
      <td>&nbsp;</td>
    </tr>
        <tr>
          <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
        <tr>
          <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="addedtion" id="addedtion" value="Submit" class="bot">
        </label></td>
      <td>&nbsp;</td>
    </tr>
  </table>
      </form>

    </body>
</html>
