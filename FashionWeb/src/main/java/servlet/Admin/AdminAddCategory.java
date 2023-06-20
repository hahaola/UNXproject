/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Admin;

import DAO.*;
import model.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.*;

@WebServlet(name = "AdminAddCategory", urlPatterns = {"/AdminAddCategory"})
public class AdminAddCategory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("nameC");
        String url = "";

        FashionDAO dao = new FashionDAO();
        List<category> ls = dao.getAllCategory();
        if (duplicationName(name, ls)) {
            request.setAttribute("show", "show");
            request.setAttribute("MESSAGE", "Exist category " + name);
            url="AdminAddCategory.jsp";
        }
        else
        {
            System.out.println(autoIncreaseID(ls) + " - " + name);
            dao.newCategory(autoIncreaseID(ls), name);
            url="AdminHome";
        }
        
        request.getRequestDispatcher(url).forward(request, response);
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

    boolean duplicationName(String name, List<category> ls) {
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getCategoryName().equals(name)) {
                return true;
            }
        }
        return false;
    }

    String autoIncreaseID(List<category> ls) {
        String id = "C";
        int noId = 1;

        for (int i = 0; i < ls.size(); i++) {
            String[] str = ls.get(i).getCategoryID().split("C");
            for (int j = 1; j < str.length; j++) {
                int no = Integer.parseInt(str[j]);
                while (noId <= no) {
                    noId++;
                }
            }
        }
        return id + noId;
    }

}
