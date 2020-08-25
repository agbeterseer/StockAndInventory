<%-- 
    Document   : modifyRoles
    Created on : Jun 29, 2011, 3:17:28 PM
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
        <title>..:: Modify Roles ::..</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
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
         String username = "";
        try{

        username = session.getAttribute("username").toString();

        }catch(Exception ex){
      response.sendRedirect("errorpage.jsp");
        }

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

        String rolename = request.getParameter("rolename");
        String defaultpage = request.getParameter("defaultpage");
        String code = request.getParameter("code");

        try{
            if(defaultpage !=null && defaultpage !="" && rolename !=null && rolename !=""){

                msg = scl.modifyRoles(new HelpRole(rolename,defaultpage));
                style = "success";
            }

        }catch(Exception ex){
        style = "error";
        System.out.println();

        }
        %>

        <%
            try{

                hr = scl.viewSingleRole(code);
         %>
<fieldset style="width:800px;">
<legend>Modify Roles</legend>
<form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" colspan="3" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td class="tab_lebel">Role Name</td>
    <td><label>
            <input type="text" name="rolename" id="rolename" style="width:200px;"  value="<%=hr.getRoleName()%>">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">Default Page</td>
    <td><label>
      <input type="text" name="defaultpage" id="defaultpage" style="width:200px;" value="<%=hr.getDefaultName()%>">
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
      <input type="submit" name="button" id="button" value="Modify" class="boton">
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form></fieldset>
    <%
   }catch(Exception ex){

    System.out.println();
   }
%>
    </body>
</html>
