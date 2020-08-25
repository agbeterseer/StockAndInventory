<%-- 
    Document   : makeSupplyFinal
    Created on : Jun 30, 2011, 11:42:37 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp"%>
<%
 String code = request.getParameter("code");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>make Supply Final</title>
           <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
         <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
        <%try{%>
         
                 <%
                
                     HelpStock hsp =null;
                    float restt = 0.0F;
                    
                     System.out.println();
                    String commodityid = request.getParameter("commodityid");
                    String unitprice = request.getParameter("unitprice");
                    String commodityName = request.getParameter("commodityName");
                    String dos = request.getParameter("dos");
                    String distributor = request.getParameter("distributor");
                    String quantitysupplied = request.getParameter("quantitysupplied");
                    String amount = request.getParameter("amount");
                    String address = request.getParameter("address");
                    String fonenumber =request.getParameter("fonenumber");
                    String quantityLeft = request.getParameter("quantityLeft");

try{

                      //  System.out.println(" COME  NOW MY DEAR");
                         //  hs = scl.viewSingleCommodity(code, whcode);
                        // CHECK IF AMOUNT OF GOODS ARE 5 AND BELOW

                       if (request.getParameter("supply") !=null){
       // System.out.println(" COME  NOW MY DEAR" +code);

                            int sub = 0;
                       // System.out.println("here code works" + code);

                          //  System.out.println(" DAT IS RIGHT na so" + quantitysupplied +"====="+ quantityLeft);
                           // System.out.println("quantitysupplied" +quantitysupplied);
                           // System.out.println("quantityLeft" +quantityLeft);
                            //new Integer(quantitysupplied).intValue() > new Integer(quantityLeft).intValue()
                             hsp = scl.viewSingleCommodity22(code);
                             // hsp.getQuantityIn().intValue() == 0
                          // int a= ;
                          // int c =;
                            if(new Integer(quantitysupplied).intValue() > new Integer(quantityLeft).intValue()){

                             response.sendRedirect("errorQuantityProLess.jsp");

                                }else{

                           sub =  hsp.getQuantityIn().intValue() - new Integer(quantitysupplied).intValue();

                           // updating store with the remainder
//System.out.println("here 00000000" + code);
                           scl.modifyStockForSupply(new HelpStock(code, new Integer(sub)));


                           // calculating the cost of item at sale point store with the remainder
//System.out.println("here 00000000 11" +code);
                           restt = scl.computeSupply(new Integer(quantitysupplied), hsp.getUnitprice().intValue());


                          // hs
                           //;
                            Float p = new Float(restt);
//System.out.println("here 00000000 2" +code);
                        msg = scl.makeSupply1(code,username,distributor,dos, new Integer(quantitysupplied), p, hsp.getWhousecode(), new Integer(sub).toString(), hsp.getCommodityName(), address, fonenumber);
                        //String commodityId, String issuedBy, String distributorId, String dateSupplied, Integer quantitySupplied, Float cogs, String whcode, String comodityname
//System.out.println("here 00000000 3" +code);

                          //  System.out.println("commodityId" +hsp.getCommodityId());
                          //  System.out.println("commodityId" +hsp.getCommodityId());
                           // System.out.println("distributor" +distributor);
                           //  System.out.println("address" +address);
                             // System.out.println("fonenumber" +fonenumber);
                              //  System.out.println("quantitysupplied" +quantitysupplied);
                              //  System.out.println("dos" +dos);




                            session.setAttribute("commodityId", hsp.getCommodityId());
                              // System.out.println("1"+ hs.getCommodityId());
                           session.setAttribute("category", hsp.getCategory());
                            //  System.out.println("3"+ hhcc.getCategory());
                           session.setAttribute("distributor", distributor);
                            ////  System.out.println("4"+distributor);
                           session.setAttribute("address", address);
                             // System.out.println("5"+address);
                           session.setAttribute("fonenumber", fonenumber);
                             // System.out.println("6"+fonenumber);
                           session.setAttribute("quantitysupplied", quantitysupplied);
                             // System.out.println("7"+quantitysupplied);
                           session.setAttribute("dos", dos);
                             // System.out.println("8"+dos);
                           session.setAttribute("restt", p.toString());
                             // System.out.println("p"+p);
                        // sdd = scl.viewSingleEdition();
                           String ed = session.getAttribute("edition").toString();

                       //  sdd.getEditionName();

                         if(ed.equalsIgnoreCase(CONFIG.getSYSTEM_EDITION_CompanyEdition())){
                                response.sendRedirect("viewInvoice.jsp");
                           }
                         //if(sdd.getEditionName().equalsIgnoreCase(CONFIG.getSYSTEM_EDITION_OfficeEdition())){
                         //  response.sendRedirect("completeSupplyForOfficeEdition.jsp");
                         // }
                         //Integer sno, String commodityId, String issuedBy, String distributorId, String dateSupplied
                            style = "success";
                            }
                            }

                       } catch (Exception ex) {
        // response.sendRedirect("errorpage.jsp");
                        }
                  
                   try{

                     hsp = scl.viewSingleCommodity22(code);
                   hs = scl.viewSingleCommodity(code, hsp.getWhousecode());

                   session.setAttribute("code", hsp.getCommodityId());
                   
                      if( hs.getQuantityIn().intValue() == 0) {
                      //  System.out.println(" GOOD WORK  UR JUST ABOUT TO MAKE THE WORLD PROUD");
                        response.sendRedirect("supplyError.jsp");
                        }
                    }catch(Exception ex){}
                    %>
      <fieldset style="width:800px;">
    <legend class="tableheader">Make Supply</legend>
    <form action="" method="post" name="form1">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="27" colspan="4" class="<%=style%>"><%=msg%></td>
    </tr>
  <tr>
    <td align="right" class="tab_lebel">Warehouse&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="41%">&nbsp;</td>
    <td width="26%">&nbsp;</td>
    <td width="15%">&nbsp;</td>
    <td width="18%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tab_lebel" align="right">Quantity Available in Store&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><label>
      <input type="text" name="quantityLeft" id="quantityLeft" value="<%=hs.getQuantityIn()%>"  style="width:200px;" readonly>
    </label></td>
    <td class="tab_lebel" align="right">Unit Price&nbsp;&nbsp; =N=</td>
    <td>&nbsp;&nbsp;<font  color="#FF0000"><%=hs.getUnitprice()%></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="14%">&nbsp;</td>
    <td width="27%" class="tab_lebel">&nbsp;</td>
    <td width="56%"><input type="hidden" name="commodityid" id="commodityid"  value="<%=hs.getCommodityId()%>"></td>
    <td width="3%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Item</td>
    <td><label>
            <input type="text" name="commodityName" id="commodityName" style="width:200px;" value="<%=scl.viewSingleCommodity2(hs.getCommodityId()).getItemname()%>" readonly>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Date</td>
    <td><label>
      <input type="text" name="dos" id="dos"  style="width:200px;">
    <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.dos);return false;" ><img name="popcal" align="absmiddle" src="popcalendar/calbtn.gif" width="34" height="22" border="0" alt=""></a></label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Quantity Supply</td>
    <td><label>
      <input type="text" name="quantitysupplied" id="quantitysupplied" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Collector's Name</td>
    <td><input type="text" name="distributor" id="distributor" style="width:200px;"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td  class="tab_lebel">Location</td>
    <td><label>
      <input type="text" name="address" id="address" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="tab_lebel">Phone Number</td>
    <td><label>
      <input type="text" name="fonenumber" id="fonenumber" style="width:200px;">
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="supply" id="suppler" value="Make Supply" class="boton"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
 <!--  PopCalendar(tag name and id must match) Tags should not be enclosed in tags other than the html body tag. -->
        <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="popcalendar/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
        </iframe>
                   </fieldset>
   <%


                       
   %>

    </body>
</html>
<%

 } catch (Exception ex) {
        // response.sendRedirect("errorpage.jsp");
 }

%>