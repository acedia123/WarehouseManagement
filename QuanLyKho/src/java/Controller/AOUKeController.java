package Controller;

import Entity.Ke;
import Entity.Kho;
import Entity.Message;
import Model.KeDAO;
import Model.KhoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AOUKeController", urlPatterns = {"/AOUKe"})
public class AOUKeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
        processRequest(request, response);
        KhoDAO dao = new KhoDAO();
        try {
            List<Kho> list = dao.getAllStores();
            request.setAttribute("listKho", list);
            request.getRequestDispatcher("addOrEditKe.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AOUKeController.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
            KeDAO dao = new KeDAO();
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String khoId = request.getParameter("khoId");
            String kichCo = request.getParameter("kichCo");
            Kho kho = new Kho(khoId, null, null);
            Message m;
            if (id != null) {
                Ke ke = new Ke(id, name, kichCo, null, 0, null, kho, 0);
                Boolean checkStatus = dao.editKe(ke);
                if (checkStatus) {
                    m = new Message("Sửa thành công", true);
                } else {
                    m = new Message("Sửa thất bại", false);
                }
            } else {
                Ke ke = new Ke(null, name, kichCo, null, 0, null, kho, 0);
                Boolean checkStatus = dao.addKe(ke);
                if (checkStatus) {
                    m = new Message("Thêm mới thành công", true);
                } else {
                    m = new Message("Thêm mới thất bại", false);
                }
            }
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(m.getName() + "-" + m.getStatus());
        } catch (Exception ex) {
            Logger.getLogger(AOUKeController.class.getName()).log(Level.SEVERE, null, ex);
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
