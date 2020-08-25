<%-- 
    Document   : viewStoreByCategory1
    Created on : Oct 10, 2011, 1:00:29 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewStoreByCategory</title>
     <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
       
    </head>
    <body>

    <%
     ArrayList list = new ArrayList();
        String search1 = request.getParameter("search1");
        try{
            
            list = scl.viewAllStocks(whcode);

        if(search1 !=null && search1 !=""){ 

        list = scl.viewStoreByCategory(search1,whcode);
        
          }
       }catch(Exception ex){
        System.out.println();
        }
	%>
  <form action="" method="post" id="myform" name="myform">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" class="tableheader"><strong>view All Goods In Store</strong></td>
    </tr>
</table>

<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td width="22%" height="19"><strong>Items</strong></td>
    <td width="23%"><strong>Available Quantity</strong></td>
    <td width="24%"><strong>ReceivedDate</strong></td>
    <td width="15%"><strong>[Transfer items]</strong></td>
    <td width="8%"><strong>[Details]</strong></td>
    <td width="8%"><strong>[modify]</strong></td>
  
  </tr>
        <%
           if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
    <td height="19" colspan="9" bgcolor="#FFCC99">No Records Found!</td>
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
                        hs  =(HelpStock )it.next();
                        sum += hs.getQuantityIn().intValue();
                       if (count % 2 == 0) {
                       style = "even";
                       } else {
                       style = "odd";
                       }
     %>

  <tr class="<%=style%>">
      <td class="tab_lebel"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></td>
    <td class="tab_lebel"><%=hs.getQuantityIn()%></td>
    <td class="tab_lebel"><%=hs.getReceivedDate()%></td>
    <td class="tab_lebel"><a href="movestocks.jsp?code=<%=hs.getCode()%>"><img src="images/Transfer.png" width="21" height="21"></a></td>
    <td class="tab_lebel"><a href="viewSingleItem.jsp?code=<%=hs.getCode()%>"><img src="images/Coherence.png" width="21" height="21"></a></td>
    <td class="tab_lebel"><a href="modifyCommodity.jsp?code=<%=hs.getCode()%>"><img src="img/edit.png" alt="no image" width="21" height="21"></a></td>
 
  </tr>
  <%
 count++;
   }
  %>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr class="tableheadB">
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
          <td width="16%" ><%=h%>&nbsp;Record(s) Found</td>
          <td width="77%">Total Quantity=<%=sum%></td>
          <td width="7%" >&nbsp;</td>
    </tr>
        <tr class="art-postmetadataheader">
           <td height="16" colspan="4"><div id="pageNavPosition2" align="justify">
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
