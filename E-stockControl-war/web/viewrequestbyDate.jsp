<%-- 
    Document   : viewrequestbyDate
    Created on : Oct 12, 2011, 5:17:51 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewrequestbyDate</title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>
    </head>
    <body>
         <%
        ArrayList list = new ArrayList();
        ArrayList lisst = new ArrayList();
        String receiveddate = request.getParameter("receiveddate");
        String ord = request.getParameter("ord");

       try{
           if(request.getParameter("button") !=null && receiveddate !=null){

               //System.out.println("receiveddate===:"+ receiveddate);
                 lisst = scl.viewAllRequestByDate(receiveddate);
                    ///  System.out.println("back to jsp===:"+ list.size());

                 }
           if(request.getParameter("byorder") !=null){

               response.sendRedirect("viewOrders.jsp");
               
               }

       }catch(Exception ex){

       System.out.println();
       }
        %>
       <form action="" method="post" id="form1" name="form1">
      <table width="80%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="22" colspan="4" class="tableheadB"><strong>..:: Purchase orders ::..</strong></td>
        </tr>
        <tr>
          <td height="21">&nbsp;</td>
          <td height="21">&nbsp;</td>
          <td>&nbsp;</td>
          <td height="21">&nbsp; </td>
        </tr>
        <tr>
          <td width="14%" height="21">&nbsp;</td>
       <td width="21%" height="21"><button class="tablehead" name="byorder">Search By Status</button></td>
          <td width="13%">&nbsp;</td>
          <td width="52%" height="21">
          <input type="text" name="receiveddate" id="receiveddate" style="width:200px;">
            <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.receiveddate);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt="">
           
          </a> <input type="submit" name="button" id="button" value="Search" class="bot"></td>
        </tr>
        <tr>
          <td height="21">&nbsp;</td>
          <td height="21">&nbsp;</td>
          <td>&nbsp;</td>
          <td height="21">&nbsp;</td> 
        </tr>
      </table>
    </form>
            <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>

 
      <form action="" name="2" method="post">
     <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21" class="tableheader">List of <strong>Purchase orders</strong></td>
    </tr>
</table>

      <table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
        <tr class="tableheader">
          <td height="19"><strong>CommodityName</strong></td>
          <td><strong>Quantity</strong></td>
          <td><strong>Date Of Order</strong></td>
          <td><strong>Status</strong></td>
          <td>Authorization</td>
        </tr>
        <%
                if(lisst != null) {
            try{
                if(lisst.isEmpty()) {
        %>
       <tr>
    <td height="20" colspan="5" bgcolor="#FFCC99">No Records Found !</td>
    </tr>
        <%
                }else{
                    Iterator it = lisst.iterator();
                    int h = 0;
      %>
        <%
                   int count = 0;
                   int sum = 0;
                while(it.hasNext()){
                        h++;
                        hrp  =(HelpRequisition )it.next();
                      sum += hrp.getQuantity().intValue();

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
        <tr class="tableheadB">
          <td >&nbsp;</td>
          <td >&nbsp;</td>
        </tr>
        <tr>
          <td width="15%" ><%=h%> &nbsp;Record(s) Found</td>
          <td width="85%" >Total .Q &nbsp;<font color="#FF0000"><%=sum%></font></td>
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
        lisst.clear();
        }
        }catch(Exception ex){
        System.out.println("Oops! an Exception Occured!! due to: " + ex.getMessage());
        }
        }
%>
    </form>
     
    </body>
</html>

