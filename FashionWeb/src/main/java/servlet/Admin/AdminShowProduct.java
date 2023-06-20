/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Admin;

import DAO.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;
import model.*;

@WebServlet(name = "AdminShowProduct", urlPatterns = {"/AdminShowProduct"})
public class AdminShowProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<Product> listP = null;

        int page = Integer.parseInt(request.getParameter("page"));

        FashionDAO Rdao = new FashionDAO();
        List<Product> pl = Rdao.getAllProduct();
        List<category> cl = Rdao.getAllCategory();

        request.setAttribute("page", page);
        int size = pl.size() / 5;
        if(pl.size() % 5 != 0) size ++;
        request.setAttribute("sizeProduct", size);
        
        HttpSession session = request.getSession();
        session.setAttribute("PRODUCT", pl);
        request.setAttribute("cl", cl);

        for (int i = 0; i <= (pl.size() / 5); ++i) {
            if (((page - 1) == i)) {
                listP = Rdao.getProductPage(i * 5);
            }
        }
        session.setAttribute("listP", listP);
        RequestDispatcher rd = request.getRequestDispatcher("AdminProduct.jsp");
        rd.forward(request, response);
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
        processRequest(request, response);
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
