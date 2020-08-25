<%-- 
    Document   : adminModifyStaffRecords
    Created on : Jun 30, 2011, 2:10:32 PM
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
        <title>admin Modify Staff Records</title>
            <link rel="stylesheet" href="./style.css" type="text/css" media="screen" />
		<!--[if IE 6]><link rel="stylesheet" href="./style.ie6.css" type="text/css" media="screen" /><![endif]-->
		<!--[if IE 7]><link rel="stylesheet" href="./style.ie7.css" type="text/css" media="screen" /><![endif]-->
          <script type="text/ecmascript" language="javascript" src="js/validation.js"></script>
    </head>
    <body>
     <%
          SControlLocal scl = null;
          LGAHelper lp = null;
          NationalityHelper np = null;
          StateHelper shh = null;
          String msg = "";
          String style = "";
          staffHelper sh = null;
        %>
        <%
            try {
                InitialContext c = new InitialContext();
                SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
                scl = rv.create();
            } catch (Exception ne) {
                System.out.println();
            }
        %>
        <%
        String username = request.getParameter("username");
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
            if (username != null && username != "" && password != null && password != "" && firstname != null && firstname != "" && homeaddress != "" && homeaddress != null && fonenumber != null && fonenumber != "" && lga != null && lga != "" && position != null && position != "" && stateoforigin != "" && stateoforigin != null && gender != "" && gender != "" && nationality != null && nationality != "") {


               msg = scl.modifyStaffRecords(new staffHelper(username, "", "", gender, position, "", "", "", homeaddress, fonenumber, "", null, ""));
//String username, String firstName, String lastName, String gender, String position, String nationality, String stateOfOrigin, String lga, String homeAddress, String phoneNumber, String dateOfAppointment, byte[] passport, String whcode
             //  System.out.println("this my point of wahalaoooooo i don pass am");
                 style = "success";
              }
            } catch (Exception ex) {
            System.out.println();
                style = "error";
            }
        %>
         <%
        try{

            sh = scl.viewSingleStaff(username);

         %>
         <form action="" method="post"  name="form1"onsubmit="return validate(this);">


          <fieldset style="width:600px; margin-left:25%;" >
                            
          
          <legend><font face="Arial, Helvetica, sans-serif"  color="#669966"><strong>Personal Details</strong></font></legend>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td  class="tab_lebel">First name</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="firstname" id="firstname" value="<%=(request.getParameter("firstname") != null) ? request.getParameter("firstname") : sh.getFirstName()%>" >
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td class="tab_lebel">Last name</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="lastname" id="lastname" value="<%=(request.getParameter("lastname") != null) ? request.getParameter("lastname") : sh.getLastName()%>" >
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td class="tab_lebel">Position</td>
                      <td><label>
                              <select name="position" id="position" style="width:200px;">
                                  <option value="--select one--">--select one--</option>
                                  <option value="STOCK"<%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("STOCK") ? new String("selected") : new String("")%>>stock</option>
                                  <option value="SUPPLY" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("SUPPLY") ? new String("selected") : new String("")%>>supply</option>
                                  <option value="PRODUCTION" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("PRODUCTION") ? new String("selected") : new String("")%>>production</option>
                                  <option value="POS" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("POS") ? new String("selected") : new String("")%>>pos</option>
                                     <option value="ADMIN" <%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("ADMIN") ? new String("selected") : new String("")%>>admin</option>
                              </select>
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td height="23" class="tab_lebel">Home address</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="homeaddress" id="homeaddress" value="<%=(request.getParameter("homeaddress") != null) ? request.getParameter("homeaddress") : new String("")%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td class="tab_lebel">Phone number</td>
                      <td><label>
                              <input type="text"  style="width:200px;" name="fonenumber" id="fonenumber" value="<%=(request.getParameter("fonenumber") != null) ? request.getParameter("fonenumber") : new String("")%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td><input type="submit"  class="bot"  name="button" id="button"  value="Modify"  ></td>
                      <td>&nbsp;</td>
                  </tr>
              </table>
    </fieldset>

        </form>
                              <%
            }catch(Exception ex){
            System.out.println();}
             %>
    </body>
</html>
