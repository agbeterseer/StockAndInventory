<%-- 
    Document   : InventoryInquiries
    Created on : Oct 4, 2011, 8:05:13 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Inquiries</title>
             <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
            <%
       int sum = 0;
       int sum1 = 0;
      ArrayList list = new ArrayList();
      String Compatements = request.getParameter("Compatements");
      String stockitemtype = request.getParameter("stockitemtype");
            try{
                list = scl.viewAllStocks(whcode);
                
                 if(request.getParameter("stockitemtype") !=null){
                 list = scl.viewStoreByCategoryAndWareHouse(stockitemtype, whcode);

                 System.out.println("jsp====" +list.size());
               }

               
               if(request.getParameter("Compatements") !=null){
                 list = scl.viewStoreByCompartments(whcode,Compatements);
               }
                
            }catch(Exception ex){
            System.out.println();
            }
            %>

  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="19" class="tableheader"><strong> Stock At hand</strong></td>
    </tr>
  </table>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="17%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
      <td width="56%">&nbsp;</td>
    </tr>
    <tr>
      <td>Category</td>
        <td>   <form method="post" name="form1" action="">
<select name="stockitemtype" id="stockitemtype" onChange="this.form.submit();">
      <option value="">--Select one Category--</option>
       <%
                            try{
                            ArrayList listt = scl.viewAllCategory();
                            Iterator i = listt.iterator();
                            while(i.hasNext()){
                              hcc = (HelpCategory)i.next();

                            %>
        <option value="<%=hcc.getCategorycode()%>"<%=(request.getParameter("stockitemtype") != null && request.getParameter("stockitemtype").equalsIgnoreCase(hcc.getCategorycode())) ? new String("selected") : new String("")%>><%=hcc.getStockItemType()%></option>
        <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
            %>
        </select></form></td>
        
      <td><form action="" method="post"><label>
        <select name="Compatements" id="Compatements" onChange="this.form.submit();">
              <option  value="">--Select one Compactment--</option>
        <%
                            try{
                            ArrayList listt = scl.viewAllSections(whcode);
                            Iterator i = listt.iterator();
                            while(i.hasNext()){
                            hsec = (HelpSection)i.next();
        %>
        <option value="<%=hsec.getName()%>"<%=(request.getParameter("Compatements") != null && request.getParameter("Compatements").equalsIgnoreCase(hsec.getName())) ? new String("selected") : new String("")%>><%=hsec.getName()%></option>
        <%
                            }
                            }catch(Exception ex){
                            ex.getMessage();
                            }
            %>
        </select>
      </label></form></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
<form action="" method="post">
<table width="80%" border="0" cellspacing="0" cellpadding="0" id="results">
  <tr>
    <td height="23" colspan="2"><a href="generateStockPDF.jsp">[GENERATE REPORT pdf]</a></td>
    <td width="21%">&nbsp;</td>
    <td width="23%">&nbsp;</td>
    </tr>
  <tr class="tableheader">
    <td width="22%" height="20"><strong>CommodityId</strong></td>
    <td width="25%"><strong>CommodityName</strong></td>
    <td><strong>Available Quantity </strong></td>
    <td><strong>ReceivedDate</strong></td>
    </tr>

    <%         if(list != null) {
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
                        //  sum2 +=hsup.getCogs().intValue();
                        sum += hs.getQuantityIn().intValue();
        		     if(count%2==0){
                                 style= "even";
                                 }else{
                                 style = "odd";
                                 }
  %>
  <tr class="<%=style%>">
    <td height="25" class="tab_lebel"><a href="viewSingleItem.jsp?code=<%=hs.getCode()%>"><%=hs.getCommodityId()%></a></td>
    <td class="tab_lebel"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></td>
    <td class="tab_lebel"><%=hs.getQuantityIn()%></td>
    <td class="tab_lebel"><%=hs.getReceivedDate()%></td>
    </tr>
 <%
 count++;
  }
  %>
</table>
<table width="80%" border="0"  cellpadding="0" cellspacing="0">
        <tr>
          <td width="21%" height="26"><%=h%> &nbsp;Record(s) Found</td>
          <td width="30%"><div align="right">Total quantity==</div></td>
          <td width="24%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000"><%=sum%></font></td>
          <td width="10%">&nbsp;</td>
          <td width="15%">   </td>
    </tr>
      <tr>
       <td >&nbsp;</td>
       <td colspan="4" align="right">&nbsp;</td>
     </tr>
     <tr>
       <td colspan="5" class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
          if(request.getParameter("Compatements") !=null){
          
		   %>
       <table width="80%" border="0" cellspacing="0" cellpadding="0">
            <tr>
         
              <td width="43%" height="24"><div align="right"><%=hsec.getName()%></div></td>
              <td width="20%" align="right"><strong>Available Quantity </strong></td>
              <td width="37%"><%=sum%></td>
         </tr>
          </table>
          <%  }%>
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
