/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package stockservlet;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import stockcontrolsession.SControlLocal;
import stockcontrolsession.SControlLocalHome;

/**
 *
 * @author Terseer
 */
public class imageUpload extends HttpServlet {
      private byte[] pic = null;
 SControlLocal scl = null;
    TreeMap tmap = null;

    byte [] fileName = null;
  
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
        PrintWriter out = response.getWriter();
          String username = "";
        tmap = new TreeMap();
         // get reference to session object
        HttpSession session = request.getSession();

        // Create a session local object
        scl = lookupSControlBean();
        //mspl = lookupApplicationAndAdmissionBean();

        // Create a factory for disk-based file items
        FileItemFactory factory = new DiskFileItemFactory();

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException ex) {
            ex.printStackTrace();
        }

        // Process the uploaded items
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();

            if (item.isFormField()) {
                tmap.put(item.getFieldName(),item.getString());
              //  System.out.println("i am inside if");
            } else {
                // Process a file upload in memory
               File tempfile=new File(item.getName());
                fileName = item.get();
                InputStream ips=new ByteArrayInputStream(fileName);
               // setPic(item.get());
               // System.out.println("i have set pics");
                  try {
                   username =  session.getAttribute("username").toString();
                    //setPic(item.get());

                setPic(scl.imageResizer(ips, 120, 120));
                } catch (Exception ex) {
                   // response.sendRedirect("appPotoError.jsp");
               // System.out.println("this is where the problem lies" );
                    ex.printStackTrace();
                }
            }
            }

        // get form data
        String regno = tmap.get("regno").toString();

        // attempt update here
        if(pic != null && regno != null && regno.length() > 0) {
            try {
                //System.out.println("regno is inside servelet"+regno);
                  scl.UploadStaffPic(regno, pic);
                 response.sendRedirect("viewSingleStaff.jsp");

               //  String  msg = session.getAttribute("appli").toString();

               // msg = "Picture successfully changed!";
               // session.setAttribute("msg",msg);
              //  response.sendRedirect("generic.jsp?c=1");
            }
            catch(Exception ex){
               // msg = "Erro! Picture not changed, please contact admin";
                //session.setAttribute("msg",msg);
               // response.sendRedirect("generic.jsp?c=0");
            }
        }
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet PrincipalPhoto</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet PrincipalPhoto at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        out.close();
    }

    public byte[] getPic() {
        return pic;
    }

    public void setPic(byte[] pic) {
        this.pic = pic;
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

}
