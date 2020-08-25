<%-- 
    Document   : printLoginDetails
    Created on : Jun 29, 2011, 10:31:15 AM
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
        <title>printLoginDetails</title>
	  <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
             <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
         <%
          SControlLocal scl = null;
          LGAHelper lp = null;
          NationalityHelper np = null;
          StateHelper shh = null;
          String msg = "";
          String style = "";
          helplogin hl = null;
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

        String username = session.getAttribute("username").toString();
            try{
              hl = scl.viewSingleUser(username);
        %>
      <form action="" method="post"><table width="48%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:1px solid #CCC">
  <tr>
    <td width="39%">&nbsp;</td>
    <td width="50%">&nbsp;</td>
    <td width="11%"><a href="javascript:window.close();">[Close]</a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div align="center"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><div align="right">Username</div></td>
    <td align="center"><strong><%=hl.getUsername()%></strong></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div align="center"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><div align="right">Password</div></td>
    <td><div align="center"><strong><%=hl.getPassword()%></strong></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td><a href="javascript:window.print();">[print]</a></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
      <%
            }catch(Exception ex){
            System.out.println();
            }
      %>
    </body>
</html>
