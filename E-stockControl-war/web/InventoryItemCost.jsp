<%-- 
    Document   : InventoryItemCost
    Created on : Aug 21, 2011, 3:25:22 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
  <%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Item Cost</title>
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
            
          list = scl.viewAllCategory();


        if(search1 !=null && search1 !=""){

        list = scl.viewItemsByCategory2(search1);
          }
          }catch(Exception ex){
        System.out.println();
        }
	%>
              
<form action="" method="post" onsubmit="return validate(this);">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22" class="tableheadB"><strong>..:: view Items By Category ::..</strong></td>
    </tr>
</table>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="19">&nbsp;</td>
      <td colspan="2">Enter Category</td>
    </tr>
    <tr>
      <td width="42%" height="18">&nbsp;</td>
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

<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">

    <td width="30%" height="20">&nbsp;&nbsp;&nbsp;&nbsp;<strong>Category</strong></td>
    <td width="70%">&nbsp;&nbsp;&nbsp;&nbsp;<strong>[Cost]</strong></td>
  </tr>
   <%
           if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
    <td height="19"  colspan="2" bgcolor="#FFCC99">No Record(s) Found!</td>
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
                        hcc  =(HelpCategory )it.next();
		
                       if (count % 2 == 0) {
                       style = "even";
                       } else {
                       style = "odd";
                       }
     %>
  <tr class="<%=style%>">
    <td height="28" class="tab_lebel"><%=hcc.getStockItemType()%></td>
    <td class="tab_lebel"><a href="moveToMakeOrBuy.jsp?code=<%=hcc.getCategorycode()%>">[Cost]</a></td>
  </tr>
  <%
  count++;
  }
  %>
</table>

  <table width="80%" border="0"  cellpadding="0" cellspacing="0">
    <tr  >
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td width="94%" ><%=h%>&nbsp;Record(s) Found</td> 
      <td width="6%" >&nbsp;</td>
    </tr>
    <tr class="art-postmetadataheader">
      <td height="14" colspan="2" ><div id="pageNavPosition2" align="justify">
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

</body>
</html>

