/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Admin;

import DAO.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import model.*;

/**
 *
 * @author lenovo
 */
public class AdminHome extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        LoginDAO dao = new LoginDAO();
        FashionDAO Rdao = new FashionDAO();
        OrderDAO Odao = new OrderDAO();

        ArrayList<Account> al = dao.getAllAcc();
        List<Role> role = dao.getAllRole();

        List<Product> pl = Rdao.getAllProduct();
        List<category> cl = Rdao.getAllCategory();

        List<BillOrder> bol = Odao.getAllOrder();

        HttpSession session = request.getSession();

        session.setAttribute("PRODUCT", pl);
        request.setAttribute("cl", cl);

        session.setAttribute("USERLIST", al);
        session.setAttribute("role", role);
        
        session.setAttribute("billOrder", bol);

        RequestDispatcher rd = request.getRequestDispatcher("Admin/AdminHome.jsp");
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
