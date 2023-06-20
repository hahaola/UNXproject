/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import DAO.FashionDAO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.category;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "SubtractCartServlet", urlPatterns = {"/SubtractCartServlet"})
public class SubtractCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FashionDAO dao = new FashionDAO();
        List<category> listC = dao.getAllCategory();
        request.setAttribute("listC", listC);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        Cookie arr[] = request.getCookies();
        String txt = "";

        for (Cookie o : arr) {
            if (o.getName().equals("id")) {
                txt = txt + o.getValue();
                o.setMaxAge(0);
                response.addCookie(o);
            }
        }
        String ids[] = txt.split("/");
        String txtOutPut = "";
        int check = 0;
        for (int i = 0; i < ids.length; i++) {
            if (ids[i].equals(id)) {
                check++;
            }
            if (check != 1) {
                if (txtOutPut.isEmpty()) {
                    txtOutPut = ids[i];
                } else {
                    txtOutPut = txtOutPut + "/" + ids[i];
                }
            } else {
                check++;
            }
        }
        if (!txtOutPut.isEmpty()) {
            Cookie c = new Cookie("id", txtOutPut);
            c.setMaxAge(60);
            response.addCookie(c);
        }
        response.sendRedirect("ShowCart");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            processRequest(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(SubtractCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            throws IOException {
        try {
            processRequest(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(SubtractCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
