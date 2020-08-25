<%-- 
    Document   : viewStoreByCategory2
    Created on : Oct 10, 2011, 2:35:43 PM
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

        list = scl.viewStoreByCategory(search1, whcode);
          }

       }catch(Exception ex){
        System.out.println("na jsp be this oooooo"+ex.getMessage());
        }
	%>

<form action="" method="post">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="19" class="tableheader"><strong>view All Goods In Store</strong></td>
    </tr>
</table>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="19">&nbsp;</td>
      <td colspan="2">Enter Commodity Name</td>
    </tr>
    <tr>
      <td width="42%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
              <input type="text" name="search1" id="search1" style="width:300px;" onchange="this.form.submit();" >
      </label></td>
      <td><input type="submit" name="button" id="button" value="Inventory Search"  class="bot"></td>
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

 <form action="" method="post" id="myform" name="myform">


<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td width="25%" height="19"><strong>Items</strong></td>
    <td width="23%"><strong>Available Quantity</strong></td>
    <td width="20%"><strong>ReceivedDate</strong></td>
    <td width="15%"><strong>[Transfer items]</strong></td>
    <td width="9%"><strong>[Details]</strong></td>
    <td width="8%"><strong>[Modify]</strong></td>
   
  </tr>
        <%
           if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
    <td height="19" colspan="8" bgcolor="#FFCC99">No Records Found!</td>
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
                        hs = (HelpStock)it.next();
		 sum += hs.getQuantityIn().intValue();
                       if (count % 2 == 0) {
                       style = "even";
                       } else {
                       style = "odd";
                       }
 
     %>
  <tr class="<%=style%>">
    <td height="25"  class="tab_lebel"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></td>
    <td class="tab_lebel"><%=hs.getQuantityIn()%></td>
    <td class="tab_lebel"><%=hs.getReceivedDate()%></td>
    <td class="tab_lebel"><a href="movestocks.jsp?code=<%=hs.getCommodityId()%>"><img src="images/Transfer.png" width="21" height="21"> </a></td>
    <td class="tab_lebel"><a href="viewSingleItem.jsp?code=<%=hs.getCommodityId()%>"><img src="images/Coherence.png" width="21" height="21"></a></td>
    <td class="tab_lebel"><a href="modifyCommodity.jsp?code=<%=hs.getCommodityId()%>"><img src="img/edit.png" alt="no image" width="21" height="21"></a></td>
  </tr>
  <%
  // System.out.println(" come on?????????"+hs.getCompactments());
 count++;
   }
  %>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
  <tr >
    <td >&nbsp;</td>
    <td width="74%" >&nbsp;</td>
    <td></td>
  </tr>
  <tr>
    <td width="19%" ><%=h%> &nbsp;Record(s) Found
    <td width="74%">Total Q.==&nbsp;&nbsp;<font color="#FF0000"><%=sum%></font></td>
    <td width="7%" >&nbsp;</td>
  </tr>
  <tr>
    <td height="18" colspan="3" class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
