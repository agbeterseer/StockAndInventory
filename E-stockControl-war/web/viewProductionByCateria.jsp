<%-- 
    Document   : viewProductionByCateria
    Created on : Jun 27, 2011, 12:49:44 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Production By Category</title>
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
        if(search1 !=null && search1 !=""){

        list = scl.viewCommodityByType(search1);
        
        }

        }catch(Exception ex){
        System.out.println();
        }

            %>
<form action="" method="post">
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr class="tableheader">
      <td height="18">View  Productions By Cateria</td>
    </tr>
  </table>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">Enter Name of Product</td>
    </tr>
    <tr>
      <td width="42%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="text" name="search1" id="search1" style="width:300px;">
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
      <td><label></label></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<form action="" method="post"><table width="80%" border="0" cellpadding="0" cellspacing="0" id="results">
  
     <tr class="tableheader">
    <td height="20"><strong>Category</strong></td>
    <td><strong>Quantity Produced</strong></td>
    <td><strong>Date Of Production</strong></td>
    <td><strong>Modify</strong></td>
    <td class="tab_lebel"><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
  </tr>
    <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
    <td height="18" colspan="5" bgcolor="#FFCC99">No Records Found !</td>
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
    <td class="tab_lebel"><%=hpr.getQuantityProduced()%></td>
    <td class="tab_lebel"><%=hpr.getDateOfProduced()%></td>
     <td class="tab_lebel"><a href="modifyProduction.jsp?code=<%=hpr.getCommodityid()%>"><img src="img/edit.png" alt="no image"></a></td>
    <td class="tab_lebel"><input type="checkbox" name="remove" value="<%=hpr.getCommodityid()%>"></td>
  </tr>
  <%
  count++;
  }
  %>
  <tr class="tableheadB">
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
  <table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td width="45%"><%=h%> Record(s) Found</td>
          <td width="47%"></td>
          <td width="8%"><input type="submit" name="delete" id="delete" value="Remove" class="bot"></td>
        </tr>
        <tr>
          <td height="23" colspan="3" class="art-postmetadataheader"><div id="pageNavPosition" align="justify">
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
