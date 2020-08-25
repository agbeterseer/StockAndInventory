<%-- 
    Document   : createDataBase
    Created on : Jul 1, 2011, 4:39:11 PM
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
        <title>..::Create Database::..</title>
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
        String database = request.getParameter("database");
        String host = request.getParameter("host");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        %>

        <%
        try{
            if(database !=null && database !="" && host !=null && host !="" && username !=null && username !="" && password !=null && password !=""){

            msg = scl.addDatabase(new HelpDb(host,username,password,database));
              }

        }catch(Exception ex){
        System.out.println();
        }
            %>
        <form action="" method="post"><table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td width="19%">&nbsp;</td>
    <td width="23%">&nbsp;</td>
    <td width="55%">&nbsp;</td>
    <td width="3%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Database</td>
    <td><label>
      <input type="text" name="database" id="database" style="width:200px;">
    </label></td>
    <td><label></label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Host</td>
    <td><label>
      <input type="text" name="host" id="host" style="width:200px;">
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
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">Username</td>
    <td><input type="text" name="username" id="username" style="width:200px;"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel">&nbsp;</td>
    <td class="tab_lebel">password</td>
    <td><label>
    <input type="password" name="password" id="password" style="width:200px;">
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
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
        
    </body>
</html>
