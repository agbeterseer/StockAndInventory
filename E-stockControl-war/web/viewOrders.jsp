<%-- 
    Document   : viewOrders
    Created on : Oct 12, 2011, 12:11:15 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
        <%
        ArrayList list = new ArrayList();
        //ArrayList lisst = new ArrayList();
        String receiveddate = request.getParameter("receiveddate");
        //String bydate = request.getParameter("bydate");
        String ord = request.getParameter("ord");

       try{
           if(request.getParameter("bydate") !=null ){

            //   System.out.println("receiveddate===:"+ receiveddate);
               response.sendRedirect("viewrequestbyDate.jsp");
           //    System.out.println("back to jsp===:"+ list.size());

                 }
           if(ord !=null && request.getParameter("button") !=null){

               list = scl.viewAllRequestByStatus(ord);
         
               }

       }catch(Exception ex){

       System.out.println();
       }
        %>
       <form action="" method="post" id="for1" name="for1">
      <table width="80%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="19" colspan="4" class="tableheader"><strong>..:: All Purchase orders ::..</strong></td>
        </tr>
        <tr> 
          <td height="21">&nbsp;</td>
          <td height="21">&nbsp;</td>
          <td>&nbsp;</td>
          <td height="21">&nbsp; </td>
        </tr>
        <tr>
          <td width="18%" height="21">&nbsp;</td>
       <td width="22%" height="21"><label>
             <select name="ord" id="ord">
              <option value="...select one.......">.......Select one Status.......</option>
              <option value="<%=CONFIG.getORDER_FOR_GOODS()%>"<%=(request.getParameter("ord") != null && request.getParameter("ord").equalsIgnoreCase(CONFIG.getORDER_FOR_GOODS())) ? new String("selected") : new String("")%>><%=CONFIG.getORDER_FOR_GOODS()%></option>
              <option value="<%=CONFIG.getRECEIVE_GOODS()%>" <%=(request.getParameter("ord") != null && request.getParameter("ord").equalsIgnoreCase(CONFIG.getRECEIVE_GOODS())) ? new String("selected") : new String("")%>><%=CONFIG.getRECEIVE_GOODS()%></option>
          </select>
          </label></td>
          <td width="12%">&nbsp;</td>
          <td width="48%" height="21"><button  class="tablehead" name="bydate">Search By Date</button></td>
        </tr>
        <tr>
          <td height="21">&nbsp;</td>
          <td height="21">&nbsp;</td>
          <td><input type="submit" name="button" id="button" value="Search" class="bot"></td>
          <td height="21">&nbsp;</td>
        </tr>
      </table>
    </form>
            <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>

         
      <form action="" name="1" method="post">
      <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" class="tableheader">List of <strong>Purchase orders</strong></td>
    </tr>
</table>
      <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
        <tr class="tableheader">
          <td height="21"><strong>Commodity Name</strong></td>
          <td><strong>Quantity</strong></td>
          <td><strong>Date Of Order</strong></td>
          <td><strong>Status</strong></td>
          <td>Authorization</td>
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
                while(it.hasNext()){
                        h++;
                        hrp  =(HelpRequisition )it.next();
			            if (count % 2 == 0) {
                                        style = "even";
                                     } else {
                                         style = "odd";
                                     }
        %>
     
        <tr class="<%=style%>">
          <td class="tab_lebel"><%=scl.viewSingleCommodity2(hrp.getCommodityId()).getItemname()%></td>
          <td class="tab_lebel"><%=hrp.getQuantity()%></td>
          <td class="tab_lebel"><%=hrp.getDateoFRequest()%></td>
          <td class="tab_lebel"><%=hrp.getStatus()%></td>
          <td class="tab_lebel"><%=hrp.getManager()%></td>
        </tr>
            <%
   count++;
   }
  %>
      </table>
      <table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr >
          <td >&nbsp;</td>
          <td >&nbsp;</td>
        </tr>
        <tr>
          <td width="94%" ><%=h%> &nbsp;Record(s) Found</td>
          <td width="6%" >&nbsp;</td>
        </tr>
        <tr>
          <td height="23" colspan="2" class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
