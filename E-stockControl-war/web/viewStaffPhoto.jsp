<%-- 
    Document   : viewStaffPhoto
    Created on : Jul 1, 2011, 12:02:52 PM
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
        <title>View Photo</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
          <script src="js/validation.js" type="text/javascript"></script>
      </head>
    <body>
          <%
          SControlLocal scl = null;
          LGAHelper lp = null;
          NationalityHelper np = null;
          StateHelper shh = null;
          String msg = "";
          String style = "";
          staffHelper sh = null;
        %>
        <%
            try {
                InitialContext c = new InitialContext();
                SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
                scl = rv.create();
            } catch (Exception ne) {
                System.out.println();
            }
        %>
        <%
    // System.out.println("inside view staff photo jsp===="+sh.getUsername());

     String username = "";
      try{

      username = session.getAttribute("username").toString();

       sh = scl.viewSingleStaff(username);
       }catch(Exception ex){
     response.sendRedirect("errorpage.jsp");
      }
        %>
     <form action="imageUpload" name="form1" id="form1"enctype="multipart/form-data" method="post" onsubmit="return checkform(this);">
     <table width="30%" border="0">
         <tr>
        <td><img src="<%=(sh.getPassport() !=null) ? "sImgage" : "images/nopic_64.gif"%>" alt="Upload Picture Here"  name="upload" width="140" height="130" id="upload" align="middle" />
          <input name="regno" type="hidden" id="regno" value="<%=sh.getUsername()%>"></td>
      </tr>
      <tr>
        <td><label>
          <input type="file" name="file" id="photo" onBlur="return checkExt(this);">
        </label>
          <label>
              <input name="ss" type="submit" id="ss" value="Upload" class="bot">
          </label></td>
      </tr>
      <tr>
      <td> </td>
      </tr>
      </table>
    </form>
    <table width="30%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="modifyStaffRecords.jsp">[Modify Records]</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
