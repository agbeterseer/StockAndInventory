<%-- 
    Document   : createRoles
    Created on : Jun 29, 2011, 10:59:36 AM
    Author     : Terseer
--%>

<%@page import="javax.ejb.*,java.lang.*,javax.naming.InitialContext,javax.rmi.PortableRemoteObject,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="stockcontrolhelper.*"%>
<%@page import="stockcontrolsession.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>createRoles</title>
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
          helpUits hu = null;
          HelpRole hr = null;
        %>
      
        <%
          try {
                InitialContext c = new InitialContext();
                SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
                scl = rv.create();
            } catch (Exception ne) {
                System.out.println();
            }
          ArrayList list = new ArrayList();
        %>
          <%
         String username = "";
        try{

        username = session.getAttribute("username").toString();

        }catch(Exception ex){
      response.sendRedirect("errorpage.jsp");
        }
        %>
        <%
        String rolename = request.getParameter("rolename");
        String defaultpage = request.getParameter("defaultpage");

        try{
            if(defaultpage !=null && defaultpage !="" && rolename !=null && rolename !=""){

                msg = scl.addRoles(new HelpRole(rolename,defaultpage));

                style = "success";
            }
        }catch(Exception ex){
        style = "error";
        System.out.println();
        }
        %>
<fieldset style="width:800px;"><legend class="tableheader">Add Roles</legend><form action="" method="post" onsubmit="return validate(this);"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="23%" class="tab_lebel">&nbsp;</td>
    <td width="24%" class="tab_lebel">Role Name</td>
    <td width="49%"><label>
    <select name="rolename" id="rolename" style="width:200px;">
        <option value="--select one--">--select one--</option>
        <option value="STOCK"<%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("STOCK") ? new String("selected") : new String("")%>>stock</option>
        <option value="SUPPLY" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("SUPPLY") ? new String("selected") : new String("")%>>supply</option>
        <option value="PRODUCTION" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("PRODUCTION") ? new String("selected") : new String("")%>>production</option>
        <option value="POS" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("POS") ? new String("selected") : new String("")%>>pos</option>
        <option value="ADMIN" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("ADMIN") ? new String("selected") : new String("")%>>admin</option>
      </select>
    </label></td>
    <td width="4%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Default Page</td>
    <td><label>
      <input type="text" name="defaultpage" id="defaultpage" style="width:200px;">
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
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="button" id="button" value="Submit" class="bot">
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form></fieldset>
    </body>
</html>
