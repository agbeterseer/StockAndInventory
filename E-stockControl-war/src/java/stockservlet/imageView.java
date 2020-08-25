/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockservlet;

import java.io.IOException;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import stockcontrolhelper.staffHelper;
import stockcontrolsession.SControlLocal;
import stockcontrolsession.SControlLocalHome;

/**
 *
 * @author Terseer
 */
public class imageView extends HttpServlet {
   SControlLocal scl = null;
      String msgg = null;
         TreeMap tmap = null;
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        String pK = request.getParameter("regno");
        //System.out.println("pk is " + pK);
        if(pK != null) {
            response.flushBuffer();

            response.setContentType("image/jpg");
            ServletOutputStream outStream = response.getOutputStream();

            scl = this. lookupSControlBean() ;
            staffHelper sh = scl.viewSingleStaff(pK);

            if(response.isCommitted()) {
                outStream.write(sh.getPassport());
                response.flushBuffer();
            }
        }
    }
      private SControlLocal lookupSControlBean() {
        try {
            Context c = new InitialContext();
            SControlLocalHome rv = (SControlLocalHome) c.lookup("java:comp/env/SControlBean");
            return rv.create();
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
