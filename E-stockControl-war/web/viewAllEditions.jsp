<%-- 
    Document   : viewAllEditions
    Created on : Nov 24, 2011, 10:10:30 PM
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
        <title>viewAllEditions</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
	<script language="javascript"  src="js/paging.js" type="text/javascript"></script>
	 <script type="text/javascript">
        function confirmation() {
	var answer = confirm("Are you Sure you want to Reset?");
	if (answer)
            return true;
         else
            return false;
           }
        </script>
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
            StockEdtion sdd = null;


            try {
                InitialContext c = new InitialContext();
                SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
                scl = rv.create();
            } catch (Exception ne) {
                System.out.println(ne.getMessage());
            }

            ArrayList list = new ArrayList();
%>

        <%
        String code = request.getParameter("code");
        String mema = request.getParameter("mema");

       // ArrayList list = new ArrayList();
        try{
            list = scl.viewAllEditions();

            if(code!=null){
              msg = scl.removeEdition(code);

            }
            if(mema !=null){

            response.sendRedirect("addSockAndInventoryEdition.jsp"); 
            }

        }catch(Exception ex){
        System.out.println();
        }
        %>
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="25%">&nbsp;</td>
    <td width="75%">&nbsp;</td>
  </tr>
  <tr class="tableheader1">
    <td height="23"><a href="viewAllEditions.jsp"></a></td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tableheader">
    <td height="23"><a href="viewAllEditions.jsp">PREVIOUS</a></td>
    <td><a href="logout.jsp">Logout</a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<form action="" method="post" id="myform" name="myform">


<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" id="results">
  <tr class="tableheader1">
    <td width="25%" height="27"><strong>Editions</strong></td>
    <td width="23%">Status</td>
    <td width="9%"><strong>[Details]</strong></td>
    <td width="8%"><strong>[Reset]</strong></td>
  </tr>
        <%
           if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  
     <%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
      %>
      <%
                   int count = 0;
                   int sum = 0;
                while(it.hasNext()){
                        h++;
                        sdd = (StockEdtion)it.next();
		// sum += hs.getQuantityIn().intValue();

                       if (count % 2 == 0) {
                       style = "even";
                       } else {
                       style = "odd";
                       }
             //System.out.println(" come on?????????"+hs.getCommodityId());
                 //scl.viewSingleCommodity2().getItemname()
     %>
  <tr class="<%=style%>">
      <td height="25" class="tab_lebel"><%=sdd.getEditionName()%></td>
    <td class="tab_lebel"><%=sdd.getEditionStatus()%></td>
    <td class="tab_lebel"><a href="viewSingleItem.jsp?code=<%=sdd.getId()%>"><img src="images/Coherence.png" width="21" height="21"></a></td>
    <td class="tab_lebel"><a href="viewAllEditions.jsp?code=<%=sdd.getId()%>" onClick="return confirmation();"><img src="img/edit.png" alt="no image" width="21" height="21"></a></td>
  </tr>
  <tr><td height="20"><%=h%>Record(s) Found</td>
  </tr>
  <%
  // System.out.println(" come on?????????"+hs.getCompactments());
 count++;
   }
  %>
</table>

<%
        list.clear();
        }
        }catch(Exception ex){
        System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
        }
        }
%>
</form>
<form  action="" name="" method="post">
<table width="50%" border="0" align="center"  cellpadding="0" cellspacing="0">
  <tr>
    <td width="22%" >
    <td width="63%">&nbsp;</td>
    <td width="15%">
      <input type="submit" name="mema" value="Set Edition" class="boton">    </td>
  </tr>
  <tr>
    <td height="23" colspan="3" class="tableheader"><div id="pageNavPosition2" align="justify">
      <script type="text/javascript"><!--
        var page = new Pager('results', 25);
        page.init();
        page.showPageNav('page', 'pageNavPosition2');
        page.showPage(1);
//--></script>
    </div></td>
  </tr>
</table>
</form>
    </body>
</html>
