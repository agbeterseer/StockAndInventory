<%-- 
    Document   : viewAllProductions
    Created on : Jun 16, 2011, 11:31:16 AM
    Author     : Terseer
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>all Productions</title>
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
       if(request.getParameter("delete") !=null ){
       String[] pk = request.getParameterValues("remove");
        System.out.println("pk1"+ pk);
        //int[] pk =Integer.parseInt(xi);
            if(pk != null) {
            //int intarray[] = new int[pk.length];
               System.out.println("pk2"+ pk);
            try{
                for(int i = 0; i < pk.length; i++) {
               msg = scl.removeProduction(new Integer(pk[i]));

           }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
        %>
        <%
        ArrayList list = new ArrayList();
        try{
        //list = rpl.viewAllProduction(); 
        list = scl.viewAllProduction();
        
        }catch(Exception ex){
        System.out.println();
        }
         %>
         <form action="" method="post" name="myform" id="myform">
         <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr class="tableheadB">
    <td width="41%" height="25">View All Items</td>
    <td width="43%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
</table>

         <table width="80%" border="0" cellpadding="0" cellspacing="0" id="results">
         <tr class="tableheader1">
    <td width="14%" height="20">Item</td>
    <td width="23%">Category</td>
    <td width="24%">QuantityProduced</td>
    <td width="23%">Date Of Produced</td>
    <td width="7%">[modify]</td>
    <td width="9%"><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
  </tr>
    	<%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  <tr>
    <td height="21" colspan="6" bgcolor="#FFCC99">No Records Found !</td>
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
		 if(count % 2 == 0){
		      style = "even";
                } else {
                style = "odd";
                }
  %>
  <tr class="<%=style%>">
    <td height="26"  class="tab_lebel"><%=scl.viewSingleCommodity2(hpr.getCommodityid()).getItemname()%></td>
    <td class="tab_lebel"><%=hpr.getCommodityType()%></td>
    <td class="tab_lebel"><%=hpr.getQuantityProduced()%></td>
    <td class="tab_lebel"><%=hpr.getDateOfProduced()%></td>
    <td class="tab_lebel"><a href="modifyProduction.jsp?code=<%=hpr.getCommodityid()%>"><img src="img/edit.png" alt="no image"></a></td>
    <td><input type="checkbox" name="remove" value="<%=hpr.getCommodityid()%>"> </td>
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
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label></label></td>
  </tr>
</table>
      <table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td width="45%"   ><%=h%> Record(s) Found</td>
          <td width="46%"></td>
          <td width="9%"><input type="submit" name="delete" id="delete" value="Remove" class="bot"></td>
        </tr>
        <tr>
          <td height="23" colspan="3"  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
