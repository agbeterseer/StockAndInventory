<%-- 
    Document   : supAddWarehouse
    Created on : Sep 27, 2011, 12:11:07 PM
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
        <title>supAddWarehouse</title>
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
    String warehouse = request.getParameter("warehouse");
    String addresses = request.getParameter("addresses");
    String capacityi = request.getParameter("capacityi");
    String cdate = request.getParameter("cdate");
    String branchcode = request.getParameter("branchcode");

    try{
    if(request.getParameter("addwhouse") !=null){
       // System.out.println("warehouse"+warehouse);
       /// System.out.println("addresses"+addresses);
       // System.out.println("capacityi"+capacityi);
       // System.out.println("cdate"+cdate);
        //System.out.println("branchcode"+branchcode);
        //System.out.println("warehouse"+warehouse);
       msg = scl.addWareHouse(new helpwarehouse(warehouse,cdate,"",addresses,capacityi,branchcode));
       style = "success";
        //String houseName, String dateCreated, String status, String address, String capacity, String bcode
        }
    }catch(Exception ex){
       //response.sendRedirect("errorpage.jsp");
    }
     %>
     <form action="" method="post"><table width="67%" border="0" align="center"  cellpadding="0" cellspacing="0">
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
    <fieldset style="width:800px; padding-left:200px">
    <legend class="tableheader">Add Warehouse</legend>
    <form action="" method="get" name="form1"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="27" colspan="2" class="<%=style%>"><%=msg%></td>
  </tr>
  <tr>
    <td width="33%"  class="tab_lebel">Warehouse Name</td>
    <td width="67%"><label>
      <input type="text" name="warehouse" id="warehouse"  style="width:200px;">
     
    </label> 
      <samp style="font-size:11px">(warehouse name must be 3 letters and more)</samp></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Capacity</td>
    <td><label>
      <input type="text" name="capacityi" id="addresses"  style="width:200px;">
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Date Created</td>
    <td><label>
      <input type="text" name="cdate" id="created date" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.cdate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><span class="tab_lebel">Address</span></td>
    <td><textarea name="addresses" id="address" cols="45" rows="5"></textarea></td>
  </tr>
  <tr>
    <td height="18">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td class="tab_lebel">Brach</td>
    <td><label>
      <select name="branchcode" id="branchcode">
          <option value="">....select one.....</option>
                <%
                            try{
                            ArrayList list = scl.viewAllBranch();
                            Iterator i = list.iterator();
                            while(i.hasNext()){
                                hbb = (HelpBranch)i.next();
                %>
      <option value="<%=hbb.getBranchCode()%>"<%=(request.getParameter("branchcode") != null && request.getParameter("branchcode").equalsIgnoreCase(hbb.getBranchCode())) ? new String("selected") : new String("")%>><%=hbb.getBranchCode()%></option>
                 <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
                 %>
      </select>
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="addwhouse" id="addwhouse" value="Submit"  class="boton"></td>
  </tr>
</table>
</form>
<!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
 </iframe>
</fieldset>
</body>
</html>
