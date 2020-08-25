<%-- 
    Document   : stockReportPDF
    Created on : Jul 1, 2011, 1:35:59 PM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>STOCK REPORT</title>
         <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
     <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
    </head>
    <body>
    
      <%
      ArrayList list = new ArrayList();
      int sum = 0;
            try{

                list = scl.viewAllStocks(whcode);
                
            }catch(Exception ex){
            System.out.println();
            }
            %>
<form action="" method="post">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="19" class="tableheader"><strong>..:: view All Goods In Store::..</strong></td>
    </tr>
</table>

<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr>
    <td height="20" colspan="2"><a href="generateStockPDF.jsp">[GENERATE REPORT]</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
 

  </tr>
  <tr class="tableheader">
    <td><strong>CommodityName</strong></td>
    <td><strong>Quantity</strong></td>
    <td><strong>ReceivedDate</strong></td>
    <td>Category</td>
   
  </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
   <tr>
    <td height="23" colspan="8" bgcolor="#FFCC99">No Records Found!</td>
    </tr>
     <%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
     
                  int count = 0;
                while(it.hasNext()){
                        h++;
                        hs  =(HelpStock )it.next();
			     if(count%2==0){
                                 
                                 style = "even";
                                 }else{

                                 style = "odd";
                                 }
  %>
  <tr class="<%=style%>">
    <td height="26"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></td>
    <td><%=hs.getQuantityIn()%></td>
    <td><%=hs.getReceivedDate()%></td>
    <td><%=scl.viewSingleCategory(hs.getCategory()).getStockItemType()%></td>

  </tr>
    <%

count++;
  }
  %>
    </table>
    <table width="80%" border="0"  cellpadding="0" cellspacing="0">
      <tr >
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td width="16%" ><%=h%>&nbsp;Record(s) Found</td>
        <td width="77%">Total Quantity=<%=sum%></td>
        <td width="7%" >&nbsp;</td>
      </tr>
      <tr  class="art-postmetadataheader">
        <td height="17" colspan="4"><div id="pageNavPosition" align="justify">
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
