<%-- 
    Document   : viewAllITems
    Created on : Oct 14, 2011, 9:47:24 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewAllITems</title>
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
	var answer = confirm("Are you Sure you want to Deactivate this Item?");
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
                    // items Bean
               msg = scl.removeCommodity(pk[i]);



           }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
        %>

        <%
        String Avail = "";
        String NotAvail = "";
        
        ArrayList list = new ArrayList();
        
        try{

           list = scl.viewAllCommodities();
        }catch(Exception ex){
        System.out.println();
        }

        %>
        <form action="" method="post" name="myform" id="myform">
       <table width="80%" border="0" cellspacing="0" cellpadding="0">
         <tr class="tableheader">
           <td height="17" ><strong>..:: view All Items ::..</strong></td>
         </tr>
       </table>
       <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td width="25%" height="20"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Item</strong></td>
    <td width="23%"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Category</strong></td>

    <td width="20%"><strong>&nbsp;&nbsp;&nbsp;&nbsp;View</strong></td>
    <td width="11%"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Modify</strong></td>
    <td width="15%"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Activate</strong></td>
    <td width="6%"><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
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
                while(it.hasNext()){
                        h++;
                        hhcc = (Helpcommodity)it.next();
                     
                       //hs.getCommodityId();
                       String nam = "";
                      // scl.viewSingleCommodity(Id, whcode)
                      
		        if (count % 2 == 0) {
                       style = "even";
                       } else {
                       style = "odd";
                       }
     %>
  <tr class="<%=style%>">
    <td height="19" class="tab_lebel"><%=hhcc.getItemname()%></td>
    <td class="tab_lebel"><%=scl.viewSingleCategory(hhcc.getCategory()).getStockItemType()%></td>

 
    <td class="tab_lebel"><a href="ViewSinglitem.jsp?code=<%=hhcc.getItemcode()%>">[view]</a></td>
    <td class="tab_lebel"><a href="modifyItems.jsp?code=<%=hhcc.getItemcode()%>"><img src="img/edit.png" alt="no image" width="21" height="21"></a></td>
    <td class="tab_lebel"><font>active</font></td>
    <td><input type="checkbox" name="remove" value="<%=hhcc.getItemcode()%>" class="tab_lebel" ></td>
  </tr>
  <%
  count++;
  }
 %>
</table>
       <table width="80%" border="0"  cellpadding="0" cellspacing="0">
         <tr >
           <td colspan="3">&nbsp;</td>
         </tr>
         <tr>
           <td width="94%" ><%=h%>&nbsp;Record(s) Found</td>
           <td width="6%" ><input type="submit" name="delete" id="delete" value="Deactivate"  class="bot" onclick="return confirmation();"></td>
         </tr>
         <tr  class="art-postmetadataheader">
           <td height="16" colspan="2"><div id="pageNavPosition2" align="justify">
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
