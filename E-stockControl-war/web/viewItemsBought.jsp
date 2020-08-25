<%-- 
    Document   : viewItemsBought
    Created on : Oct 17, 2011, 10:14:16 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Items Bought</title>
            <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
  
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
             //  System.out.println("pk2"+ pk);
            try{
                for(int i = 0; i < pk.length; i++) {
               //msg = scl.removeProduction(new Integer(pk[i]));

           }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
        %>
        <%
        try{

        list = scl.viewAllCommodities1(CONFIG.getSTOCK_ITEM_BUY());

        }catch(Exception ex){
        System.out.println();
        }
         %>
         <form action="" method="post" name="myform" id="myform">
          <table width="80%" border="0" cellspacing="0" cellpadding="0">
             <tr class="tableheader">
               <td width="24%" height="17">View  Items</td>
               <td width="24%">&nbsp;</td>
               <td width="21%"></td>
               <td width="12%"></td>
               <td width="19%"></td>
            </tr>
           </table><table width="80%" border="0" cellpadding="0" cellspacing="0" id="results">
    <tr class="tableheader">
    <td height="20"><strong>Item Name</strong></td>
    <td><strong>Item Category</strong></td>

       <td ><strong>[Add To Store]</strong></td>
    <td><strong>[Quantity Adjustment]</strong></td>
    </tr>
     <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
    %>
     <tr>
     <td height="22" colspan="4" bgcolor="#FFCC99">No Records Found !</td>
   </tr>
    <%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
    %>

    <%
                int count = 0;
                int sum =0;
                while(it.hasNext()){
                h++;
                 hhcc = (Helpcommodity)it.next();
                // sum += new Integer(hpr.getQuantityProduced()).intValue();
              //  hs =  scl.viewSingleCommodity(hhcc.getItemcode(), whcode);
                          //  hs.getQuantityIn();
                                   if (count % 2 == 0) {
                                         style = "even";
                                     } else {
                                         style = "odd";
                                     }
     %>
    <tr class="<%=style%>">
    <td height="26"class="tab_lebel"><%=hhcc.getItemname()%></td>
    <td class="tab_lebel"><%=scl.viewSingleCategory(hhcc.getCategory()).getStockItemType()%></td>
   <td class="tab_lebel"><a href="addItemsBought.jsp?code=<%=hhcc.getItemcode()%>"><img src="images/Add.png" width="21" height="21"></a></td>
    <td class="tab_lebel"><a href="adjustQuantityOfItemBought.jsp?code=<%=hhcc.getItemcode()%>"><img src="images/Add Green Button.png" width="21" height="21"></a></td>
  </tr>
 <%
  count++;
   }
  %>
  <tr>
    <td colspan="5">&nbsp; </td>
   </tr>
  <tr>
    <td colspan="2"><%=h%> Record(s) Found</td>
    <td></td>
     <td></td>
  </tr>
</table>
           <table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td height="22"  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
