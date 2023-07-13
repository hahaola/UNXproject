/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.WishlistController;

import DAO.FashionDAO;
import DAO.WishlistDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Product;
import model.Wishlist;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "AddToWishlist", urlPatterns = {"/AddToWishlist"})
public class AddToWishlist extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String id = request.getParameter("id");
        Account acc = (Account) session.getAttribute("NAME");

        if (acc == null) {
            request.setAttribute("message", "<h1 class='text-danger'>Please Login first</h1>");
            request.getRequestDispatcher("HomeServlet").forward(request, response);
            return;
        }

        FashionDAO fdao = new FashionDAO();
        Product p = fdao.getProduct(id);
        if (p == null) {
            request.setAttribute("message", "<h1 class='text-danger'>Some Error has occur</h1>");
            request.getRequestDispatcher("HomeServlet").forward(request, response);
            return;
        }

        System.out.println("ADD TO WISHLIST");
        WishlistDAO wdao = new WishlistDAO();
        wdao.addToWishlist(p.getPID(), acc.getAccID());
        request.getRequestDispatcher("HomeServlet").forward(request, response);
    }
}
