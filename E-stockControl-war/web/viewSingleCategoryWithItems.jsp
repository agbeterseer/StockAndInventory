<%-- 
    Document   : viewSingleCategoryWithItems
    Created on : Oct 17, 2011, 1:25:16 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewSingleCategory </title>
         <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
        <script language="javascript"  src="js/paging.js" type="text/javascript"></script>

</head>
    <body>
        <%
        String code = request.getParameter("code");
        ArrayList list = new ArrayList();
        String categp = "";

        try{

            hcc = scl.viewSingleCategory(code);
           categp = hcc.getStockItemType();

            list = scl.viewStoreByCategoryAndWareHouse(code, whcode);
           }catch(Exception ex){
        System.out.println();
        }
        %>
     <form action="" method="post"><table width="60%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td valign="top" align="center"><strong><%=categp%></strong></td>
         <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td height="18" class="tableheader"><strong>..::View Items ::..</strong></td>
           </tr>
         </table>
           <table width="100%" border="0" cellspacing="0" cellpadding="0" id="results">
            <tr class="tableheader">
             <td width="48%" height="18"><strong>Items</strong></td>
             <td width="35%"><strong>Action</strong></td>
             <td width="17%">&nbsp;</td>
           </tr>
         <%
           if(list != null) {
            try{
                if(list.isEmpty()) {
        %>
           <tr>
             <td colspan="3" bgcolor="#FFCC99">No Records Found</td>
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
		        if (count % 2 == 0) {
                       style = "even";
                       } else {
                       style = "odd";
                       }
     %>
           <tr class="<%=style%>">
               <td height="25"><a href="viewSingleItem.jsp?code=<%=hs.getCommodityId()%>"><%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%></a></td>
             <td><a href="viewStoreByCategory1.jsp">[Action]</a></td>
             <td>&nbsp;</td>
           </tr>
           <%
		   count++;
		   }
            %>
         </table>
           <table width="100%" border="0"  cellpadding="0" cellspacing="0">
             <tr  >
               <td colspan="3">&nbsp;</td>
             </tr>
             <tr>
               <td width="94%" ><%=h%>&nbsp;Record(s) Found</td>
               <td width="6%" >&nbsp;</td>
             </tr>
             <tr>
               <td colspan="2" class="art-postmetadataheader"><div id="pageNavPosition2" align="justify">
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
    %></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
       </tr>

     </table>
</form>
    </body>
</html>
