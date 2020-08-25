<%-- 
    Document   : modifyUserRecords
    Created on : Jun 29, 2011, 9:02:43 AM
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
        <title>JSP Page</title>
        <link href="css/standerd.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
          SControlLocal scl = null;
          LGAHelper lp = null;
          NationalityHelper np = null;
          StateHelper shh = null;
          String msg = "";
          String style = "";
        %>
        <%
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
        String code = request.getParameter("code");
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
            if (username != null && username != "" && surname != null && surname != "" && firstname != null && firstname != "" && position !=null && position !="") {
              // msg = scl.createUser(new helplogin(username, password, position));
               
               msg = scl.modifyStaffRecords(new staffHelper(username, firstname, lastname, gender, position, "", "", "", homeaddress, fonenumber, "", null,""));
               style = "success";
              // System.out.println("this my point of wahalaoooooo i don pass am");
                //String username, String firstName, String lastName, String gender, String position, String nationality, String stateOfOrigin, String lga, String homeAddress, String phoneNumber, String dateOfAppointment, byte[] passport
            }
            } catch (Exception ex) {
            System.out.println();
                style = "error";
            }
        %>
        <%
        try{
            sh = scl.viewSingleStaff(code);
        %>
        <form action="" method="post">
                        <fieldset style="width:600px; ">
                            <legend><font face="Arial, Helvetica, sans-serif"  color="#669966"><strong>Login details</strong></font></legend>
                            <table width="100%" border="0"  cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="3" class="<%=style%>"><%=msg%></td>
                                </tr>
                                <tr>
                                    <td width="30%">&nbsp;</td>
                        <td width="65%"></td>
                                    <td width="5%">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Username</td>
                                  <td><input type="text" style="width:200px;" name="username" id="username" value="<%=(request.getParameter("username") != null) ? request.getParameter("username") : sh.getUsername()%>"></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                  <td><label></label></td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
          </fieldset>
          <fieldset style="width:600px; ">
                            <legend><font face="Arial, Helvetica, sans-serif"  color="#669966"><strong>Personal Details</strong></font></legend>
              <table width="100%" border="0"  cellpadding="0" cellspacing="0">
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Surname</td>
                      <td><label>
                              <input type="text"  style="width:200px;" name="surname" id="surname" value="<%=(request.getParameter("surname") != null) ? request.getParameter("surname") : sh.getUsername()%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>First name</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="firstname" id="firstname" value="<%=(request.getParameter("firstname") != null) ? request.getParameter("firstname") : sh.getFirstName()%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Last name</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="lastname" id="lastname" value="<%=(request.getParameter("lastname") != null) ? request.getParameter("lastname") : sh.getLastName()%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Position</td>
                      <td><label>
                              <select name="position" id="position" style="width:200px;">
                                  <option value="--select one--">--select one--</option>
                                  <option value="ADMIN"<%=request.getParameter("position") != null && request.getParameter("position").equalsIgnoreCase("STOCK") ? new String("selected") : new String("")%>>stock</option>
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
                      <td height="23">Home address</td>
                      <td><label>
                              <input type="text" style="width:200px;" name="homeaddress" id="homeaddress" value="<%=(request.getParameter("homeaddress") != null) ? request.getParameter("homeaddress") : sh.getHomeAddress()%>">
                          </label></td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>Phone number</td>
                      <td><label>
                              <input type="text"  style="width:200px;" name="fonenumber" id="fonenumber" value="<%=(request.getParameter("fonenumber") != null) ? request.getParameter("fonenumber") : sh.getPhoneNumber()%>">
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
                      <td><input type="submit"  class="boton"  name="button" id="button"  value="Submit"  ></td>
                      <td>&nbsp;</td>
                  </tr>
              </table>
          </fieldset>
                 <%
        }catch(Exception ex){
        System.out.println();
        }
                %>
        </form>

    </body>
</html>
