package Controller;

import Entity.Message;
import Entity.Kho;
import Model.KhoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AOUStoreController", urlPatterns = {"/AOUStore"})
public class AOUStoreController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("id");
        KhoDAO dao = new KhoDAO();
        Kho st = dao.getStoreById(code);
        request.setAttribute("Store", st);
        request.getRequestDispatcher("addOrEditStore.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AOUStoreController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            KhoDAO dao = new KhoDAO();
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            Message m;
            if (id != null) {
                Kho st = new Kho(id, name, address);
                Boolean checkStatus = dao.editStore(st);
                if (checkStatus) {
                    m = new Message("Sửa thành công", true);
                } else {
                    m = new Message("Sửa thất bại", false);
                }
            } else {
                Kho st = new Kho(null, name, address);
                Boolean checkStatus = dao.addStore(st);
                if (checkStatus) {
                    m = new Message("Thêm mới thành công", true);
                } else {
                    m = new Message("Thêm mới thất bại", false);
                }
            }
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(m.getName() + "-" + m.getStatus());
        } catch (Exception ex) {
            Logger.getLogger(AOUStoreController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
