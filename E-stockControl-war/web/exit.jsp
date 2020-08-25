<%-- 
    Document   : exit
    Created on : Feb 6, 2012, 9:40:01 PM
    Author     : Terseer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>exit</title>
        <script type="text/javascript">
        function logout() {
            var answer = window.close();

            return "login.jsp";
        }
        </script>
    </head>
      <body onload="javascript:logout();">
    <%
      response.sendRedirect("login.jsp");

   %>
    </body>
</html>
