<%-- 
    Document   : productionReportPDF
    Created on : Jul 1, 2011, 1:36:51 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>..:: productionReportPDF ::..</title>
              <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
    </head>
    <body>
         

        <%
         ArrayList list = new ArrayList();
    
        try{


        //list = rpl.viewAllProduction();
        list = scl.viewAllProduction();

        }catch(Exception ex){
        System.out.println();
        }
         %>
    <form action="" method="post">
<table width="80%" border="0" cellpadding="0" cellspacing="0" id="results">
<tr>
    <td colspan="4"  class="tableheadB">View All Productions Made</td>
    </tr>
  <tr>
    <td colspan="4" > <a  href="generateProductionPDF.jsp">[GENERATE REPORT]</a></td>
    </tr>
    <tr class="tableheader1">
    <td height="20">CommodityType</td>
    <td>Commodity Name</td>
    <td>QuantityProduced</td>
    <td>DateOfProduced</td>
    </tr>
    <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
     %>
  <tr>
    <td colspan="4" bgcolor="#FFCC99">No Records Found !</td>
    </tr>
  <%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
      %>
  
  <%
                   int count = 0;
                while(it.hasNext()){
                        h++;
                        hpr  =(HelpProduction)it.next();
			if(count%2==0){
                            
                            style = "even";
                            }else{
                              style = "odd";

                            }
  %>
  <tr class="<%=style%>">
    <td height="26"  class="tab_lebel"><%=hpr.getCommodityType()%></td>
    <td><%=scl.viewSingleCommodity2(hpr.getCommodityid()).getItemname()%></td>
    <td><%=hpr.getQuantityProduced()%></td>
    <td><%=hpr.getDateOfProduced()%></td>
    </tr>
  <%
count++;
    }
               
   %>
  <tr>
    <td><%=h%> Record(s) Found</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td class="tableheader"><div id="pageNavPosition2" align="justify">
      <script type="text/javascript"><!--
        var page = new Pager('results', 25);
        page.init();
        page.showPageNav('page', 'pageNavPosition2');
        page.showPage(1);
//--></script>
    </div></td>
        </tr>
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
    </body>
</html>
