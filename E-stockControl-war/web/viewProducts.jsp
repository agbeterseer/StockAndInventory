<%-- 
    Document   : viewProducts
    Created on : Aug 17, 2011, 11:17:29 AM
    Author     : Terseer
--%>

<%@page import="javax.ejb.*,java.lang.*,javax.naming.InitialContext,javax.rmi.PortableRemoteObject,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="stockcontrolhelper.*"%>
<%@page import="stockcontrolsession.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Production</title>
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
          SControlLocal scl = null;
          ReportsLocal rpl = null;
            %>
            <%
          LGAHelper lp = null;
          NationalityHelper np = null;
          StateHelper shh = null;
          String msg = "";
          String style = "";
          HelpProduction hpr = null;
        %>
               <%
         String username = "";
        try{

        username = session.getAttribute("username").toString();

        }catch(Exception ex){
      response.sendRedirect("errorpage.jsp");
        }

            %>
        <%
            try {
                InitialContext c = new InitialContext();
                SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
                scl = rv.create();
            } catch (Exception ne) {
                System.out.println();
            }

         
          ArrayList list = new ArrayList();
        %>

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
        try{

        //list = rpl.viewAllProduction();
        list = scl.viewAllProduction();
        
        }catch(Exception ex){
        System.out.println();
        }
         %>
         <form action="" method="post" name="myform" id="myform"><table width="80%" border="0" cellpadding="0" cellspacing="0" id="results">
  <tr>
    <td height="20" colspan="6"  class="tableheader">View All Productions</td>
    </tr>
   
		<tr class="tableheader">
    <td height="20"><strong>CommodityType</strong></td>
    <td><strong>Commodity Name</strong></td>
    <td><strong>QuantityProduced</strong></td>
    <td><strong>DateOfProduced</strong></td>
    <td><strong>[add to Store]</strong></td>
    <td>&nbsp;</td>
  </tr>
   <%
                if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
   <tr>
    <td colspan="6" bgcolor="#FFCC99">No Records Found !</td>
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
  <tr class="even">
    <td height="26"  class="tab_lebel"><%=hpr.getCommodityType()%></td>
    <td><%=scl.viewSingleCommodity2(hpr.getCommodityid()).getItemname()%></td>
    <td><%=hpr.getQuantityProduced()%></td>
    <td><%=hpr.getDateOfProduced()%></td>
    <td><a href="addProduction.jsp?code=<%=hpr.getCommodityid()%>"><img src="images/Add.png" width="21" height="21"></a></td>
    <td>&nbsp;</td>
  </tr>
 <%}%>
  <tr>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><%=h%> Record(s) Found</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
      <table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
