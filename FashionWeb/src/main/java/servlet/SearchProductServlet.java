/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import DAO.FashionDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;

import model.*;

@WebServlet(name = "SearchProductServlet", urlPatterns = {"/SearchProductServlet"})
public class SearchProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("search");
        
        System.out.println("name search: " + name);
        
        HttpSession session = request.getSession();
        session.setAttribute("search", name);
        
        FashionDAO dao = new FashionDAO();

        List<Product> searchSize = dao.searchProductByName(name);
        List<Product> newP = dao.getNewProduct();

        List<Product> oldP = dao.getAllProduct();
        List<String> arrP = new ArrayList<>();
        for (int i = 0; i < oldP.size(); i++) {
            for (int j = 0; j < newP.size(); j++) {
                if (oldP.get(i).getPID().equals(newP.get(j).getPID())) {
                    arrP.add(oldP.get(i).getPID());
                }
            }
        }
        // remove product sale, only not sale
        for (int i = 0; i < oldP.size(); i++) {
            for (int j = 0; j < arrP.size(); j++) {
                if (oldP.get(i).getPID().equals(arrP.get(j))) {
                    oldP.remove(i);
                }
            }
        }

        // pagination
        int page = 1;
        String str = "";
        int pageS = 0;
        List<Product> searchP = null;
        if ((str = request.getParameter("page")) != null) 
        {
            pageS = Integer.parseInt(str);
            System.out.println("page current: " + pageS);
            for (int i = 0; i <= (searchSize.size() / 5); ++i) {
                if (((pageS - 1) == i)) {
                    searchP = dao.pageSearchProductByName(name, i * 5);
                }
            }
            request.setAttribute("page", pageS);
        } else {
            request.setAttribute("page", page);
            System.out.println("page current: " + page);
            searchP = dao.pageSearchProductByName(name, 0);
        }
        
        // search page size 
        if (searchSize.size() < 10 && searchSize.size() > 5) {
            request.setAttribute("pageSize", 2);
            System.out.println("size Product: " + 2);
        } else if (searchSize.size() < 5) {
            request.setAttribute("pageSize", 1);
            System.out.println("size Product: " + 1);
        } else {
            request.setAttribute("pageSize", (searchSize.size() / 5));
            System.out.println("size Product: " + (searchSize.size() / 5));
        }
        
        request.setAttribute("oldP", oldP);
        request.setAttribute("newP", newP);
        request.setAttribute("listP", searchP);
        request.getRequestDispatcher("searchResult.jsp").include(request, response);
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
