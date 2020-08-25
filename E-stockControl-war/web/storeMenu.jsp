<%-- 
    Document   : storeMenu
    Created on : Jun 30, 2011, 10:30:49 AM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>store</title>
         <script src="js/menu.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript"  src="js/dtree.js"></script>
<link  href="css/dtree.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="myjs/help.js"></script>
<link rel="shortcut icon" href="images/tm.gif" type="image/x-icon">
<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/p-bank-style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
       <%
         String username = "";
         String stname = "";
        try{

        username = session.getAttribute("username").toString();
        stname = session.getAttribute("stname").toString();
        }catch(Exception ex){
        response.sendRedirect("errorpage.jsp");
        }
 %>
 <form name="maincontents" id="CBIF" method="post" action="">
			<!-- Header button Start -->



			<!-- Header button End -->
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody><tr>
<td>
<table width="100%" border="0" cellspacing="3" cellpadding="0">
  <tr>
  <td width="21%" rowspan="3"><div id="header"> </div></td>
    <td colspan="2"><strong> </strong></td>
    <td width="10%" rowspan="3"><div style="float:right; padding-right:10px"></div></td>
  </tr>
  <tr><td width="60%"><font size="+1" color="#999966">Welcome ! &nbsp;</font> <font size="+1" color="#336600" > <%=stname%></font></td>
    <td width="9%"></td>
  </tr>
  </table>
<table width="100%" border="0" cellspacing="3" cellpadding="0">
  <tr valign="top">
    <td width="21%">
        <table border="0" cellspacing="3" cellpadding="0" class="menus" width="100%">
	<td><div class="SIDE">
      <a href="javascript: d.openAll();" ><span style="color:#CC66CC">Expand All</span></a>
		<span class="WW">|</span>
	<a href="javascript: d.closeAll();"><span  style="color:#CC66CC" >Close All</span></a>&nbsp;&nbsp;&nbsp;
    <span class="WW">|</span>
     <a href="adminMenu.jsp"><span  style="color:red" >Manage Store</span></a>
    </div></td></tr>
      <tr>
        <td width="250px"><div class="dtree" style="height:600px; overflow:auto;"><script type="text/javascript">
		<!--

		d = new dTree('d');

		d.add(0,-1,'e-SControl');
		//d.add(1,0,'Customer And Accounts','','Customer And Account Controls');
		//d.add(3,1,'Create New Item','');
		//d.add(5,3,'Add Item','web001/test.jsp','','ifrm');
		//d.add(6,3,'Personal','web001/customerDetails.jsp','','ifrm');
		// d.add(66,3,'Term Deposit','web001/TDcustomerDetails.jsp','','ifrm');
		//d.add(7,1,'Assign Accounts','');
		//d.add(15,7,'Non Personal','web001/assignCustomerToNonPersonalAccount.jsp','','ifrm');
		//d.add(16,7,'Personal','web001/assignCustomerToPersonalAccount.jsp','','ifrm');
        //d.add(17,7,'Issue Items','web001/issueCheckPassbook.jsp','','ifrm');
        //d.add(18,7,'Stop Payment','web001/stopCheckPay.jsp','','ifrm');
		//d.add(8,1,'Add Accounts','');
		///d.add(25,8,'Non Personal','web001/addMoreAccountsToNonPersonalCustomer.jsp','','ifrm');
		//d.add(26,8,'Personal','web001/addMoreAccountsToPersonalCustomer.jsp','','ifrm');
              //  d.add(30,1,'View Accounts','');
             //   d.add(32,30,'By Account Number','web001/customerSingleSearch.jsp','','ifrm');
             //   d.add(33,30,'All Accounts','web001/viewAllAccounts.jsp','','ifrm');
                d.add(1,0,'Inventory Items','');
                d.add(2,0,'Stock Transfers','');
                d.add(3,0,'Inventory Reports and Inquiries','');
                d.add(4,0,'Requisition','');
                d.add(34,0,'Supply','');
                d.add(5,0,'Profile','');
                 d.add(6,0,'Upload Stock from CSV','');
           

               d.add(371,5,'View Records','viewSingleStaff.jsp','','ifrm');
              // d.add(372,37,'Modify Records','modifyStaffRecords.jsp','','ifrm');
               // d.add(372,37,'Cheque Clearing','web002/chequeClear.jsp','','ifrm');
              //  d.add(373,37,'Special Cheque Clearing','web002/clearchecks.jsp','','ifrm');
              //  d.add(374,37,'End Of Month Debit Process','web002/DebitInterest.jsp','','ifrm');
               // d.add(375,37,'End Of Month Credit Process','web002/CreditInterest.jsp','','ifrm');

                d.add(361,4,'Make Request','requestForGoods.jsp','','ifrm');
                d.add(362,4,'See All Request Made','viewAllRequest.jsp','','ifrm');
                d.add(363,4,'Receive Request','purchaseordersreceived.jsp','','ifrm');
               // d.add(364,36,'Search By Category','viewAllRequestByCategory.jsp','','ifrm');
                 d.add(350,34,'Make Supply','makeSupply.jsp','','ifrm');
              //  d.add(303,34,'Create Units','addUnits.jsp','','ifrm');
                d.add(351,34,'Search All Supplies','viewAllSupplies.jsp','','ifrm');

                d.add(300,1,'Add Commodity','addCommodity.jsp','','ifrm');
                 d.add(301,1,'view Commodities ','viewAllITems.jsp','','ifrm');
                d.add(302,1,'Add Items','addItems.jsp','','ifrm');

              //  d.add(303,34,'Create Units','addUnits.jsp','','ifrm');
                d.add(303,1,'Search All','viewAllGoodsInStore.jsp','','ifrm');
                d.add(304,1,'Search Store By Category','viewStoreByCategory.jsp','','ifrm');
                d.add(305,1,'Activate Items','activateStockItem.jsp','','ifrm');
                //d.add(303,34,'Term Deposit','web001/createTermDeposit.jsp','','ifrm');

               // d.add(3000,34,'Vault Management','');
               // d.add(3001,3000,'Denomination Ledger Entries','web002/noaccess.jsp','','ifrm');
               // d.add(3002,3000,'Vault Transfer','web002/noaccess.jsp','','ifrm');
               // d.add(30001,34,'History','');
               // d.add(300010,30001,'View Batch Transaction','web001/viewBatchTransactionsByDate.jsp','','ifrm');
                // d.add(300011,30001,'Posted Transaction(Batch)','web001/viewPostedBatchTransactionsByDate.jsp','','ifrm');
                // d.add(300012,30001,'Approve Batch Posting','web001/viewAllParentAccounts.jsp','','ifrm');
                //  d.add(300013,30001,'View Posted Transaction','web001/viewAllPostedTransactions.jsp','','ifrm');
                 // d.add(300014,30001,'View UnPosted Transaction','web001/viewAllUnPostedTransactions.jsp','','ifrm');

                 //d.add(3800,38,'Entries','');
                  d.add(3811,3,'See Reports','stockReportPDF.jsp','','ifrm');
                  d.add(3812,3,'Inventory Inquiries','Inquiries.jsp','','ifrm');
                 // d.add(3813,38,'Cheque Due for Clearing','web002/clearchecks.jsp','','ifrm');
                 // d.add(3814,38,'Call Over','web001/tx.jsp','','ifrm');
                //  d.add(3815,38,'Customer Account Movement','web001/tx.jsp','','ifrm');
               //  d.add(381,3800,'G/L Register','web002/DisplayGlAcctNE.jsp','','ifrm');
               //  d.add(382,3800,'Detail Trial Balance','web002/trialbalance.jsp','','ifrm');
                 //d.add(380,38,'Financial Statement','');
                // d.add(381,380,'View Chart of Account','web002/DisplayGlAcctNE.jsp','','ifrm');
                 //d.add(382,380,'Balance Sheet','web002/DisplayGlAcct.jsp','','ifrm');
                 //d.add(383,380,'Closing Trial Balance','web002/trialbalance.jsp','','ifrm');
                 //d.add(384,380,'Trial Balance','web002/trialbalance.jsp','','ifrm');
                 //d.add(385,380,'Budget','web001/tx.jsp','','ifrm');
                // d.add(386,380,'Account Schedule','web001/tx.jsp','','ifrm');
                // d.add(387,380,'Cashiers','web001/tx.jsp','','ifrm');
                // d.add(388,38,'View All Staff','web002/viewStaff.jsp','','ifrm');

                d.add(3902,2,'Make Stock Transfers','viewStoreByCategory2.jsp','','ifrm');
                
                d.add(391,2,'Receive Stock','viewAllStockTransfers.jsp','','ifrm');

                 d.add(191,6,'Stock CSV','stcokCSV.jsp','','ifrm');
                 //
                 //d.add(392,39,'Account Category','acctcattab.jsp','','ifrm');
                 //d.add(393,39,'Loan Category','loancattab.jsp','','ifrm');
                 //d.add(394,39,'Charges','web002/chargeSetup.jsp','','ifrm');
                 //d.add(395,39,'Transaction Types','web002/CreateTransactnType.jsp','','ifrm');
                 //d.add(396,39,'Denominations','web002/CreateDenomination.jsp','','ifrm');
                 //d.add(397,39,'Cashiers','web002/CreateCashier.jsp','','ifrm');
                 //d.add(398,39,'Bank Details','web002/CreateBranch.jsp','','ifrm');
                 //d.add(399,39,'Chart of Account','web002/ChartOfAccount.jsp','','ifrm');
                 //d.add(390,39,'Customer Account Type','web002/CreateAccountType.jsp','','ifrm');
                 ///d.add(3901,39,'Gl Account Type','web002/CreateGLAccType.jsp','','ifrm');
                 //d.add(3903,39,'Totalling Levels','web002/TestTNLevels.jsp','','ifrm');
                 //d.add(3904,39,' GL Balance Initialisation','web002/Balanceinitialisation.jsp','','ifrm');
                 //d.add(3905,39,' Holiday Setup','web002/HolidaySetup.jsp','','ifrm');
                 //d.add(3906,39,' Modified Holiday','web002/HoliDayModified.jsp','','ifrm');
                 //d.add(3907,39,' Personal Profile','web002/updates.jsp','','ifrm');
                 //d.add(3908,39,' Create Roles','web002/createRoles.jsp','','ifrm');
                 //d.add(3909,39,' Create Staff Profile','web002/createStaff.jsp','','ifrm');
                d.add(29,0,'Logout','logout.jsp','','','img/globe.gif');
		document.write(d);
		//-->
	</script>
</div></td>
      </tr>
    </table></td>
    <td width="80%"><div style="overflow:auto; height:630px">
      <iframe src="default.jsp" id="ifrm" name="ifrm" frameborder="1" width="100%" height="600" align="top"></iframe>
    </div></td>
  </tr>
</table>
</td>
      </tr></tbody></table>

</form>
    </body>
</html>
