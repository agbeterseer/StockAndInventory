<%-- 
    Document   : viewAllGoodsInStore
    Created on : Jun 24, 2011, 9:33:22 PM
    Author     : Terseer 
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>..:: View Goods In Store ::..</title>
        <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
            <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
            
</head>
    <body>
       

      <%
	    ArrayList list = new ArrayList();
            try{

           list = scl.viewAllStocks();
           
            }catch(Exception ex){
            System.out.println();
            }

          %>
      <form action="" method="post" id="myform" name="myform">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="19" class="tableheader"><strong>All Goods In Store</strong></td>
    </tr>
</table>

<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td width="24%" height="20"><strong>Items</strong></td>
    <td width="23%"><strong>Available Quantity</strong></td>
    <td width="24%"><strong>ReceivedDate</strong></td>
    <td width="15%"><strong>[Transfer Stock</strong>]</td>
    <td width="7%"><strong>[Details]</strong></td>
    <td width="7%"><strong>[Modify]</strong></td>
 
  </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
        <td height="21" colspan="8" bgcolor="#FFCC99">No Record(s) Found!</td>
    </tr>
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
                        hs  =(HelpStock)it.next();
                        sum += hs.getQuantityIn().intValue();
			if (count % 2 == 0) {
                            style = "even";
                            } else {
                            style = "odd";
                             }
       %>
    <tr class="<%=style%>">
      <td class="tab_lebel"><%=(scl.viewSingleCommodity3(hs.getCommodityId())).getItemname()%></td>
    <td class="tab_lebel"><%=hs.getQuantityIn()%></td>
    <td class="tab_lebel"><%=hs.getReceivedDate()%></td>
    <td class="tab_lebel"><a href="movestocks.jsp?code=<%=hs.getCommodityId()%>"><img src="images/Transfer.png" width="21" height="21"></a></td>
    <td class="tab_lebel"><a href="viewSingleItem.jsp?code=<%=hs.getCommodityId()%>"><img src="images/Coherence.png" width="21" height="21"></a></td>
    <td class="tab_lebel"><a href="modifyCommodity.jsp?code=<%=hs.getCommodityId()%>"><img src="img/edit.png" alt="no image" width="21" height="21"></a></td>
  
    </tr>
  <% 
   count++;
   }
  %>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td >&nbsp;</td>
          <td width="74%" >&nbsp;</td>
          <td></td>
    </tr>
        <tr>
          <td width="19%" >
	  <%=h%> &nbsp;Record(s) Found
          <td width="74%">Total Q.==&nbsp;&nbsp;<font color="#FF0000"><%=sum%></font></td>
        
          <td width="7%" >&nbsp;</td>
    </tr>
     <tr>
   
     <td height="19" colspan="3" class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
