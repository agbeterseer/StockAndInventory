<%-- 
    Document   : modifyStaffRecords
    Created on : Jun 30, 2011, 10:45:17 AM
    Author     : Terseer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@include  file="lookUp.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Staff Records</title>
           <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
          <script src="js/validation.js" type="text/javascript"></script>
    </head>
    <body>
       
        <%
        String code = request.getParameter("code");
        String password = request.getParameter("password");
        String surname = request.getParameter("surname");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        String position = request.getParameter("position");
        String nationality = request.getParameter("nationality");
        String stateoforigin = request.getParameter("stateoforigin");
        String lga = request.getParameter("lga");
        String homeaddress = request.getParameter("homeaddress");
        String fonenumber = request.getParameter("fonenumber");
        %>
        <%
        try {
            
            if (request.getParameter("button") !=null) {
                   
               msg = scl.modifyStaffRecords(new staffHelper(code, "", "", "", "", "", "", "", homeaddress, fonenumber, null, null,whcode));
               //String username, String firstName, String lastName, String gender, String position, String nationality, String stateOfOrigin, String lga, String homeAddress, String phoneNumber, String dateOfAppointment, byte[] passport, String whcode
              // System.out.println("this my point of wahalaoooooo i don pass am");
                 style = "success";
              }
            } catch (Exception ex) {
            System.out.println();
                style = "error";
            }
        %>
         <%
        try{
            hstaff = scl.viewSingleStaff(username);
         %>

  <form action="" method="post">
           <fieldset style="width:600px; ">
                            <legend><font face="Arial, Helvetica, sans-serif"  color="#669966"><strong>Personal Details</strong></font></legend>
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="25%">&nbsp;</td>
                      <td width="33%">&nbsp;</td>
                      <td width="39%">&nbsp;</td>
                      <td width="3%">&nbsp;</td>
                  </tr>
                  <tr>
                    <td  class="tab_lebel">&nbsp;</td>
                      <td  class="tab_lebel">First name</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="firstname" id="firstname" value="<%=(request.getParameter("firstname") != null) ? request.getParameter("firstname") : hstaff.getFirstName()%>" readonly="readonly">
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
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Last name</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="lastname" id="lastname" value="<%=(request.getParameter("lastname") != null) ? request.getParameter("lastname") : hstaff.getLastName()%>" readonly="readonly">
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
                    <td class="tab_lebel">&nbsp;</td>
                      <td height="23" class="tab_lebel">Home address</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="homeaddress" id="homeaddress" value="<%=(request.getParameter("homeaddress") != null) ? request.getParameter("homeaddress") : hstaff.getHomeAddress()%>">
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
                    <td class="tab_lebel">&nbsp;</td>
                      <td class="tab_lebel">Phone number</td>
                      <td><label>
                              <input type="text"  style="width:200px;" name="fonenumber" id="fonenumber" value="<%=(request.getParameter("fonenumber") != null) ? request.getParameter("fonenumber") : hstaff.getPhoneNumber()%>">
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
                      <td><input type="submit"  class="bot"  name="button" id="button"  value="Modify"  ></td>
                      <td>&nbsp;</td>
                  </tr>
              </table>
    </fieldset>
  </form>
          <%
            }catch(Exception ex){
             response.sendRedirect("errorpage.jsp");

             }
           %>
    </body>
</html>
