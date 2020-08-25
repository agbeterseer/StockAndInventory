<%-- 
    Document   : generateStaffPDF
    Created on : Jul 3, 2011, 8:05:46 AM
    Author     : Terseer
--%>
<%@page import="java.io.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import ="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.servlet.ServletOutputStream"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page import = "net.sf.jasperreports.engine.JRResultSetDataSource"%>
<%@page import="javax.ejb.*,java.lang.*,javax.naming.InitialContext,javax.rmi.PortableRemoteObject,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="stockcontrolhelper.*"%>
<%@page import="stockcontrolsession.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>generate StaffPDF</title>
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
        HelpMaterials hmat = null;
        HelpSupply suup = null;
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

        HelpDb dbh = null;
        String Host1 = "";
        String username = "";
        String password = "";
        String dbname = "";
        String sno = "1";

                try {
                 //  list = msl.viewAllHost();
                  dbh = scl.viewDataBase(new Integer(sno));

                } catch (Exception ex) {
                }

          try {
        %>
        <%
               Connection connection = null;
               ServletOutputStream servletOutputStream = response.getOutputStream();
               InputStream reportStream = getServletConfig().getServletContext().getResourceAsStream("/WEB-INF/staffReport.jasper");
               response.setContentType("application/pdf");
               try {
                   Class.forName("com.mysql.jdbc.Driver");
               } catch (ClassNotFoundException ex) {
                   ex.printStackTrace();
               }
               try {
                 connection = DriverManager.getConnection("jdbc:mysql://"+ dbh.getHost() +"/"+ dbh.getDbname()+"?user="+ dbh.getUsername()+"&password="+ dbh.getPassword());
                 } catch (SQLException ex) {
                   ex.printStackTrace();
               }
               try {
                   HashMap parameterMap = new HashMap();
                //  parameterMap.put("schoolname", ms.getName());
                  // parameterMap.put("schoolcode", schoolCode);
                   //  parameterMap.put("tbtitle", sessionLocal.getBranchName(branchcode));
                   JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, parameterMap, connection);
               } catch (JRException ex) {
                   ex.printStackTrace();
               }
               try {
                   connection.close();
               } catch (SQLException ex) {
                   ex.printStackTrace();
               }
               servletOutputStream.flush();
               servletOutputStream.close();
        %>
    </body>
</html>
<%
            } catch (Exception eee) {
            }
%>