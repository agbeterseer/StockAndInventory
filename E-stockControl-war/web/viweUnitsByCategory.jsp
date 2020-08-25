<%-- 
    Document   : viweUnitsByCategory
    Created on : Jun 29, 2011, 8:46:45 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Units</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
 
        <%
          
          ArrayList list = new ArrayList();
          //String style = "";
        %>
 <%
        String search1 = request.getParameter("search1");
        try{
        if(search1 !=null && search1 !=""){

        list = scl.viewUnitsByCategory(search1,whcode);
        
        }

        }catch(Exception ex){
        System.out.println();
        }
		%>
<form action="" method="post">
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
      <td colspan="2">Enter Unit</td>
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
<form action="" method="post">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="tableheader">..::All Units::..</td>
    </tr>
</table>


<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr  class="tableheader">
    <td width="28%"><strong>Unit Name</strong></td>
    <td width="20%"><strong>Unit Type</strong></td>
    <td width="25%"><strong>Commodity Type</strong></td>
    <td width="11%"><strong>[modify]</strong></td>
    <td width="16%"><strong>[Remove]</strong></td>
    </tr>
      <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
      %>
  <tr>
    <td height="21" colspan="5"  bgcolor="#FFCC99">No Records Found</td>
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
                        hu = (helpUits)it.next();
			     if(count%2==0){
				 style = "even";
				 }else{
				 style = "odd"; 
				 }
  %>
  <tr class="<%=style%>">
    <td class="tab_lebel"><%=hu.getUnitName()%></td>
    <td><%=hu.getUnitType()%></td>
    <td><%=hu.getCommodidtyType()%></td>
    <td><a href="modifyUnits.jsp?code=<%=hu.getUnitcode()%>"><img src="img/edit.png" alt="no image"></a></td>
    <td><a href="remove.jsp">[remove]</a></td>
    </tr>
 <%
count++;
  }
  %>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="2"><%=h%>Record(s) Found</td>
    </tr>
        <tr class="art-postmetadataheader">
        
        <td ><div id="pageNavPosition2" align="justify">
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
