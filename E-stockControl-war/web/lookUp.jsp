<%-- 
    Document   : lookUp
    Created on : Aug 19, 2011, 11:53:18 AM
    Author     : Terseer
--%>

<%@page import="javax.ejb.*,java.lang.*,javax.naming.InitialContext,javax.rmi.PortableRemoteObject,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="stockcontrolhelper.*"%>
<%@page import="stockcontrolsession.*"%>
<%@page import="Utill.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


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
            HelpCategory hcc = null;
            StockEdtion sdd = null;
            HelpMaterials hlp = null;
            helpSetCost hsc = null;
            HelpInventoryCost hic = null;
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
            String username = "";
            String whcode = "";
            String edition = "";
            String sta = "";
            String valu = "";
            try {
                username = session.getAttribute("username").toString();
               // whcode = session.getAttribute("whcode").toString();
                edition = session.getAttribute("edition").toString();
               // sta = session.getAttribute("sta").toString();
               // valu = session.getAttribute("valu").toString();
                } catch (Exception ex) {
        response.sendRedirect("errorpage.jsp");
            }

             try{

        sdd = scl.viewSingleEdition(edition);

        //sdd.getEditionName();

        }catch(Exception ex){
     //  response.sendRedirect("errorpage.jsp");
        }
        %>

