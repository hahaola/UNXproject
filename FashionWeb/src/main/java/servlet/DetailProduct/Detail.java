/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.DetailProduct;

import DAO.FashionDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;

import model.*;

@WebServlet(name = "Detail", urlPatterns = {"/Detail"})
public class Detail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("pid");
        System.out.println("id detail: " + id);

        FashionDAO dao = new FashionDAO();
        Product p = dao.getProduct(id);
        System.out.println("product detail: " + p.toString());

        List<Product> relateP = dao.getRelateProduct(p.getCategoryID(), id);
        List<Product> relateP1 = dao.getRelateProduct(p.getCategoryID(), id);

        List<Product> productAll = dao.getProductByCategory(p.getCategoryID());
        List<Product> copy = dao.getProductByCategory(p.getCategoryID());

        List<Product> newP = dao.getNewProduct();
        List<category> allC = dao.getAllCategory();

        ArrayList<String> arr = new ArrayList<>();
        ArrayList<String> arr1 = new ArrayList<>();

        // relate
        for (int i = 0; i < relateP1.size(); i++) {
            for (int j = 0; j < newP.size(); j++) {
                if (relateP1.get(i).getPID().equals(newP.get(j).getPID())) {
                    arr.add(relateP1.get(i).getPID());
                }
            }
        }
        for (int i = 0; i < relateP1.size(); i++) {
            for (int j = 0; j < arr.size(); j++) {
                if (relateP1.get(i).getPID().equals(arr.get(j))) {
                    relateP1.remove(i);
                }
            }
        }
        for (int i = 0; i < relateP1.size(); i++) {
            for (int j = 0; j < relateP.size(); j++) {
                if (relateP1.get(i).getPID().equals(relateP.get(j).getPID())) {
                    relateP.remove(j);
                }
            }
        }

        // produc price sale or not
        for (int i = 0; i < productAll.size(); i++) {
            for (int j = 0; j < newP.size(); j++) {
                if (productAll.get(i).getPID().equals(newP.get(j).getPID())) {
                    arr1.add(productAll.get(i).getPID());
                }
            }
        }
        for (int i = 0; i < productAll.size(); i++) {
            for (int j = 0; j < arr1.size(); j++) {
                if (productAll.get(i).getPID().equals(arr1.get(j))) {
                    productAll.remove(i);
                }
            }
        }
        for (int i = 0; i < productAll.size(); i++) {
            for (int j = 0; j < copy.size(); j++) {
                if (productAll.get(i).getPID().equals(copy.get(j).getPID())) {
                    copy.remove(j);
                }
            }
        }

        System.out.println("old: ");
        for (Product pl : relateP1) {
            System.out.println(pl.toString());
        }
        System.out.println("new: ");
        for (Product pl : relateP) {
            System.out.println(pl.toString());
        }

        System.out.println("all: ");
        for (Product pl : productAll) {
            System.out.println(pl.toString());
        }
        System.out.println("copy: ");
        for (Product pl : copy) {
            System.out.println(pl.toString());
        }

        request.setAttribute("newP", newP);
        request.setAttribute("relatePNew", relateP);
        request.setAttribute("relatePOld", relateP1);

        request.setAttribute("PNew", copy);
        request.setAttribute("POld", productAll);

        request.setAttribute("productD", p);
        request.setAttribute("allC", allC);

        request.getRequestDispatcher("product.jsp").forward(request, response);
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
