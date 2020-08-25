<%-- 
    Document   : viewGoodsBySection
    Created on : Sep 13, 2011, 9:17:18 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewGoodsBySection</title>
      <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
          <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
          <script type="text/javascript">
      checked = false;
      function checkedAll () {
        if (checked == false){checked = true}else{checked = false}
	for (var i = 0; i < document.getElementById('myform').elements.length; i++) {
	  document.getElementById('myform').elements[i].checked = checked;
	}
      }
    </script>
         <script type="text/javascript">
        function confirmation() {
	var answer = confirm("Are you Sure you want to Remove?");
	if (answer)
            return true;
         else
            return false;
           }
        </script>
</head>
    <body>
  
        <%
        ArrayList list = new ArrayList();
       
        %>
         <%
       if(request.getParameter("delete") !=null ){
       String[] pk = request.getParameterValues("remove");
      //  System.out.println("pk1"+ pk);
        //int[] pk =Integer.parseInt(xi);
            if(pk != null) {
            //int intarray[] = new int[pk.length];
            //   System.out.println("pk2"+ pk);
            try{
                for(int i = 0; i < pk.length; i++) {
                    
               msg = scl.removeStock(pk[i]);

                }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
        %>
         <%
         String sec3 = request.getParameter("sec3");
         
            try{
                list = scl.viewAllStocks(whcode);
                
                if(request.getParameter("button") !=null){

               list = scl.viewStoreByCompartments(whcode,sec3);
               }

            }catch(Exception ex){
            System.out.println();
            }
            %>
        <form action="" method="post" onsubmit="return validate(this);">
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="42%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
      <select name="sec3" id="sec3" style="width:200px;">
        <option  value="">--Select one Sections-</option>
        <%
                            try{
                            ArrayList ldist =scl.viewAllSections(whcode);
                            Iterator i = ldist.iterator();
                            while(i.hasNext()){
                              HelpSection  seci = (HelpSection)i.next();
                         //    if(! (new Integer(seci.getCapacity()).intValue() == seci.getTrack().intValue())){
         %>
        <option value="<%=seci.getName()%>"><%=seci.getName()%></option>
        <%
                          //  }
                            }
                            }catch(Exception ex){
                            System.out.println(ex.getMessage());
                            }
         %>
      </select>
      </label></td>
      <td><input type="submit" name="button" id="button" value="Inventory Search"  class="bot"></td>
    </tr>
    <tr>
      <td height="18">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<form action="" method="post" id="myform" name="myform">
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="18"  class="tableheader"><strong>..:: All Goods In Store::..</strong></td>
    </tr>
</table>
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td><strong>Items</strong></td>
    <td><strong>Quantity</strong></td>
    <td><strong>ReceivedDate</strong></td>
    <td><strong>Section</strong></td>
    <td><strong>[Details]</strong></td>
    <td><strong>[modify]</strong></td>
    <td><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
  </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
    %>
  
   <tr>
    <td height="23" colspan="9" bgcolor="#FFCC99">No Records Found!</td>
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
			      if(count % 2 == 0){
		      style = "even";
                } else {
                style = "odd";
                }
  %>
  <tr class="<%=style%>">
   <td  class="tab_lebel"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></td>
    <td><%=hs.getQuantityIn()%></td>
    <td><%=hs.getReceivedDate()%></td>
    <td><%=hs.getCompactments()%></td>
    <td><a href="viewSingleItem.jsp?code=<%=hs.getCommodityId()%>">[view..]</a></td>
    <td><a href="modifyCommodity.jsp?code=<%=hs.getCommodityId()%>"><img src="img/edit.png" alt="no image"></a></td>
    <td><input type="checkbox" name="remove" value="<%=hs.getCommodityId()%>"></td>
  </tr>
  <% 
count++;
  }
  %>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
   <tr>
   <td colspan="3">&nbsp;</td>
    </tr>
        <tr>
          <td width="94%" ><%=h%> &nbsp;Record(s) Found</td>
          <td width="6%" ><input type="submit" name="delete" id="delete" value="Remove" class="bot" onclick="return confirmation();"></td></tr>
     <tr  class="art-postmetadataheader">
       <td colspan="2" ><div id="pageNavPosition2" align="justify">
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
