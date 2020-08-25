<%-- 
    Document   : addStockError
    Created on : Aug 11, 2011, 4:16:14 PM
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
        <title>addStockError</title>
           <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
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
           HelpSection hs = null;
           HelpProduction hpp = null;
           HelpProduction hppl = null;

        %>
        <%
         String commodityName = "";
         String username = "";
        try{
        username = session.getAttribute("username").toString();
       

        }catch(Exception ex){
      response.sendRedirect("errorpage.jsp");
        }


                 try{
             commodityName = session.getAttribute("commodityName").toString();
                  }catch(Exception ex){
                   System.out.println();
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
        /// ArrayList list = new ArrayList();
          String code = request.getParameter("code");

                 String sunit = request.getParameter("sunit");
                    String quantityin = request.getParameter("quantityin");
                    String receiveddate = request.getParameter("receiveddate");
                    String unitprice = request.getParameter("unitprice");
                  //  String commodityName = request.getParameter("commodityName");
                    String sec3 = request.getParameter("sec3");
                    String quantpro = request.getParameter("quantpro");
         %>
<form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="33%">&nbsp;</td>
    <td width="61%">&nbsp;</td>
    <td width="6%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="40" >&nbsp;</td>
    <td class="tableheader"><%=commodityName%> &nbsp; <strong>is out of Stock Please See Production Department</strong></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="28">&nbsp;</td>
    <td align="right"><a href="vPro.jsp"> [back]</a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
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
