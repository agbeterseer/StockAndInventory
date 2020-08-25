<%-- 
    Document   : viewAllCategories
    Created on : Oct 11, 2011, 10:48:31 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewAllCategories</title>
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
         <style type="text/css">
<!--
.style1 {font-weight: bold}
-->
         </style>
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
               msg = scl.removeCategory(pk[i]);

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
            
            list = scl.viewAllCategory();

        }catch(Exception ex){
        System.out.println();
        }
        %>
<form action="" method="post" id="myform" name="myform"><table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr class="tableheader">
    <td height="17">List of Categories</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr class="tableheader">
    <td height="20"><strong>Category</strong></td>
    <td><strong>Description</strong></td>
    <td><strong>Modify</strong></td>
    <td class="tab_lebel"><input name="checkall2" type="checkbox" class="style1" onClick="checkedAll();"></td>
    <td>&nbsp;</td>
  </tr>
    <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
    %>
  <tr>
    <td height="20" colspan="5" bgcolor="#FFCC99">No Records Found !</td>
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
                 hcc = (HelpCategory)it.next();

               //  sum += new Integer(hpr.getQuantityProduced()).intValue();
	
                                     if (count % 2 == 0) {
                                         style = "even";
                                     } else {
                                         style = "odd";
                                     }
    %>
  <tr class="<%=style%>">
    <td class="tab_lebel"><%=hcc.getStockItemType()%></td>
    <td class="tab_lebel"><%=hcc.getCategorydescription()%></td>
    <td class="tab_lebel"><a href="modifyCategory.jsp?code=<%=hcc.getCategorycode()%>"><img src="img/edit.png" alt="no image"></a></td>
    <td class="tab_lebel"><input type="checkbox" name="remove" value="<%=hcc.getCategorycode()%>"></td>
    <td>&nbsp;</td>
  </tr>
  <%  
  count++;
  }
  %>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
  <table width="80%" border="0"  cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td width="94%" ><%=h%> &nbsp;Record(s) Found</td>
      <td width="6%" ><input type="submit" name="delete" id="delete" value="Remove" class="bot" onclick="return confirmation();"></td>
    </tr>
    <tr class="art-postmetadataheader">
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
