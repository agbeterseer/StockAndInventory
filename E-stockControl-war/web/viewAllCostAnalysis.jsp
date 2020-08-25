<%-- 
    Document   : viewAllCostAnalysis
    Created on : Aug 21, 2011, 1:07:45 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewAllCostAnalysis</title>
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
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
          <%@include  file="lookUp.jsp"%>
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
               msg = scl.removeCostAnalysis(new Integer(pk[i]));

           }
           }catch(Exception e){
            System.out.println("Error in remove" + e.getMessage());
            }
            }
            }
       ArrayList list = new ArrayList();
        %>

        <%
        
        try{

        list = scl.viewAllCostAnalysis();
            
        }catch(Exception ex){
        System.out.println();
        }
        %>
        <form action="" method="post" name="myform" id="myform"><table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
       
  <tr>
    <td height="35" colspan="6" class="tableheader"><strong>..::List of Cost Analysis of item produced::..</strong></td>
    </tr>
  <tr class="tableheader1">
    <td height="27" ><strong>Material</strong></td>
    <td><strong>Item</strong></td>
    <td><strong>Cost</strong></td>
    <td><strong>Date</strong></td>
    <td><strong>Compute Cost</strong></td>
    <td><input name="checkall2" type="checkbox" class="style1" onClick="checkedAll();"></td>
  </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
  
  <tr>
    <td height="25" colspan="6" bgcolor="#FFCC99">No Records Found !</td>
    	<%
                }else{
                    Iterator it = list.iterator();
                    int h = 0;
      %>
    </tr>
    
      <%
                int count = 0;
                while(it.hasNext()){
                h++;
                 hca  =(HelpCostAnalysis)it.next();
		 if(count % 2 == 0){
		style = "even";
                } else {
                style = "odd";
                }
  %>
  <tr class="<%=style%>">
    <td><%=hca.getMaterials()%></td>
    <td><%=hca.getItemCode()%></td>
    <td><%=hca.getAmount()%></td>
    <td><%=hca.getDateAdded()%></td>
    <td><a href="setInventoryCost.jsp">[compute]</a></td>
    <td><input type="checkbox" name="remove" value="<%=hca.getSno()%>"></td> 
  </tr>
  <%  
    count++;
  }
 %>
</table>
     <table width="80%" border="0"  cellpadding="0" cellspacing="0">
       <tr>
         <td width="28%" ><%=h%> Record(s) Found</td>
         <td width="63%" >&nbsp;</td>
    <td width="9%" ><label>
           <input type="submit" name="delete" id="delete" value="Remove" class="boton">
         </label></td>
       </tr>
       <tr>
         <td colspan="3" class="tableheader"><div id="pageNavPosition2" align="justify">
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
