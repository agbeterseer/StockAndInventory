<%-- 
    Document   : supAddBranch
    Created on : Sep 19, 2011, 2:22:58 PM
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
        <title>supAddBranch</title>
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
        String bname = request.getParameter("bname");
        String baddress = request.getParameter("baddress");
        String bdate = request.getParameter("bdate");

        try{
            if(request.getParameter("bboton") !=null){

              msg = scl.addBranch(new HelpBranch("",bname,baddress,bdate,""));
                //String branchCode, String branchName, String branchAddress, String dateCreated, String branchStatus
                style = "success";
            }
        }catch(Exception ex){
            style = "error";
        System.out.println();

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
        </form><table width="67%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td> <fieldset style="width:800px;" >
    <legend class="tableheader">Add Branch</legend>
 <form action="" method="post" name="form1" onsubmit="return validate(this);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="28" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="19%" height="19">&nbsp;</td>
    <td width="26%">&nbsp;</td>
    <td width="44%">&nbsp; </td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Branch Name</td>
    <td><label>
      <input type="text" name="bname" id="bname" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Address</td>
    <td><label>
      <input type="text" name="baddress" id="baddress" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Date</td>
    <td><label>
   
      <input type="text" name="bdate" id="created date" style="width:200px;">
      <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.bdate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="bboton" id="bboton" value="Submit" class="bot">
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
<!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
 </iframe>
</fieldset></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

   
    </body>
</html>
