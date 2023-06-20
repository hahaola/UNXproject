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

/**
 *
 * @author lenovo
 */
@WebServlet(name = "StoreCategoryServlet", urlPatterns = {"/StoreCategoryServlet"})
public class StoreCategoryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<Product> list = null;

        String cid = request.getParameter("cid");
        int page = Integer.parseInt(request.getParameter("page"));
        String sort = request.getParameter("sort");

        System.out.println("cid: " + cid);
        System.out.println("page current: " + page);
        System.out.println("sort: " + sort);

        FashionDAO dao = new FashionDAO();
        List<Product> allP = dao.getProductByCategory(cid);

        request.setAttribute("page", page);
        int sizePage = allP.size() / 5;
        if (allP.size() % 5 != 0) {
            sizePage++;
        }
        request.setAttribute("sizeProduct", sizePage);

        request.setAttribute("cid", cid);

        List<category> cl = dao.getAllCategory();
        request.setAttribute("categoryList", cl);
        request.setAttribute("sortPage", sort);

        List<Product> newP = dao.getNewProduct();
        List<Product> oldP = dao.getProductByCategory(cid);
        List<String> arrP = new ArrayList<>();

        for (int i = 0; i < oldP.size(); i++) {
            for (int j = 0; j < newP.size(); j++) {
                if (oldP.get(i).getPID().equals(newP.get(j).getPID())) {
                    arrP.add(allP.get(i).getPID());
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
        request.setAttribute("newP", newP);
        request.setAttribute("oldP", oldP);

        switch (sort) {
            case "all":
                for (int i = 0; i <= (allP.size() / 5); ++i) {
                    if (((page - 1) == i)) {
                        list = dao.PageProductByCategory(cid, i * 5);
                    }
                }
                request.setAttribute("allSort", "selected");
                break;

            case "new":
                for (int i = 0; i <= (allP.size() / 5); ++i) {
                    if (((page - 1) == i)) {
                        list = dao.sortProductCategoryByDate(cid, i * 5);
                    }
                }
                request.setAttribute("newSort", "selected");
                break;

            case "low":
                for (int i = 0; i <= (allP.size() / 5); ++i) {
                    if (((page - 1) == i)) {
                        list = dao.sortProductCategoryByPriceLow(cid, i * 5);
                    }
                }
                request.setAttribute("lowSort", "selected");
                break;

            case "high":
                for (int i = 0; i <= (allP.size() / 5); ++i) {
                    if (((page - 1) == i)) {
                        list = dao.sortProductCategoryByPriceHigh(cid, i * 5);
                    }
                }
                request.setAttribute("highSort", "selected");
                break;

            case "rate":
                for (int i = 0; i <= (allP.size() / 5); ++i) {
                    if (((page - 1) == i)) {
                        list = dao.sortProductCategoryByRate(cid, i * 5);
                    }
                }
                request.setAttribute("rateSort", "selected");
                break;
        }

        request.setAttribute("listP", list);
        request.getRequestDispatcher("store.jsp").forward(request, response);
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
