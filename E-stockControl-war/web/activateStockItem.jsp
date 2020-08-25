<%-- 
    Document   : activateStockItem
    Created on : Oct 19, 2011, 11:17:27 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>activate stock </title>
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
	var answer = confirm("Are you Sure you want to Activate this Item?");
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
        //System.out.println("pk1"+ pk);
        //int[] pk =Integer.parseInt(xi);
            if(pk != null) {
            //int intarray[] = new int[pk.length];
            //System.out.println("pk2"+ pk);
            try{
                for(int i = 0; i < pk.length; i++) {
   
                msg = scl.activateStock(pk[i]);

           }
           }catch(Exception e){
            System.out.println("Error in activateStock" + e.getMessage());
            }
            }
            }
        %>
        <%
        ArrayList list = new ArrayList();

        String itemid = request.getParameter("itemid");
        String code = request.getParameter("code");

        try{
          list =  scl.viewAllCommoditiesForActivation();

        }catch(Exception ex)
        {
            response.sendRedirect("errorActivate.jsp");
        System.out.println("na me be this"+ex.getMessage());
        }

        %>

 <form action="" method="post">
       <table width="80%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td height="17" class="tableheader"><strong>..:: view All Items ::..</strong></td>
         </tr>
       </table>
       <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td width="25%" height="20"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Item</strong></td>
    <td width="23%"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Category</strong></td>
    <td width="20%" ><strong>&nbsp;&nbsp;&nbsp;&nbsp;View</strong></td>
    <td width="10%"><strong>&nbsp;&nbsp;&nbsp;&nbsp;Modify</strong></td>
    <td width="5%"><input type="checkbox" name="checkall2" onClick="checkedAll();"></td>
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
    <td><input type="checkbox" name="remove" value="<%=hhcc.getItemcode()%>"></td>
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
           <td width="6%" ><input type="submit" name="delete" id="delete" value="Activate"  class="bot" onclick="return confirmation();"></td>
         </tr>
         <tr>
           <td height="21" colspan="2"  class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
        else{
        response.sendRedirect("errorActivate.jsp");
        }
		%>
    </form>
    </body>
</html>
