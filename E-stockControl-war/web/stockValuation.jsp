<%-- 
    Document   : stockValuation
    Created on : Sep 30, 2011, 9:22:59 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>stockValuation</title>
 <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
				 
				 </head>
    <body>
     
      <%
      ArrayList list = new ArrayList();
            try{

                list = scl.viewAllStocks(whcode);
                
            }catch(Exception ex){
            System.out.println();
            }
            %>

<form action="" method="post">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="18" class="tableheader"><strong>..:: view All Goods In Store::..</strong></td>
    </tr>
</table>
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr>
    <td colspan="2"><a href="generateStockPDF.jsp">[GENERATE REPORT]</a></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr class="tableheader">
    <td height="21"><strong>Item ID </strong></td>
    <td><strong>Item</strong></td>
    <td><strong>QuantityIn</strong></td>
    <td><strong>QuantityLeft</strong></td>
    <td><strong>ReceivedDate</strong></td>
    <td>Location</td>
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
      %>
      <%
                   int count = 0;
                while(it.hasNext()){
                        h++;
                        hs  =(HelpStock )it.next();
			     if(count%2==0){
  %>
  <tr class="even">
    <td height="25"><%=hs.getCommodityId()%></td>
    <td><%=hs.getCommodityName()%></td>
    <td><%=hs.getQuantityIn()%></td>
    <td><%=hs.getQuantityLeft()%></td>
    <td><%=hs.getReceivedDate()%></td>
    <td>&nbsp;</td>
    </tr>
       <%}else{%>
    <%

  }
  }
  %>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="2"><%=h%> &nbsp;Record(s) Found</td>
    </tr>
     <tr>

        <td  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
      <script type="text/javascript"><!--
        var page = new Pager('results', 25);
        page.init();
        page.showPageNav('page', 'pageNavPosition2');
        page.showPage(1);
//--></script>
    </div></td></tr>
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
