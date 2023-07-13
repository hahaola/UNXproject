/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.WishlistController;

import DAO.FashionDAO;
import DAO.WishlistDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

@WebServlet(name = "GetAllWishlist", urlPatterns = {"/GetAllWishlist"})
public class GetAllWishlist extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("user");

        WishlistDAO wdao = new WishlistDAO();
        FashionDAO fdao = new FashionDAO();

        List<Wishlist> list = wdao.getAllWishlistByAccID(id);
        List<Wishlistdetail> details = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            details.add(new Wishlistdetail(list.get(i), fdao.getProduct(list.get(i).getProduct_id()), fdao.getCategoryById(fdao.getProduct(list.get(i).getProduct_id()).getCategoryID()).getCategoryName()));
        }

        String json = new Gson().toJson(details);

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(json);
        out.flush();
    }

}

class Wishlistdetail {

    private Wishlist wishlist;
    private Product product;
    private String categoryName;

    public Wishlistdetail(Wishlist wishlist, Product product, String categoryName) {
        this.wishlist = wishlist;
        this.product = product;
        this.categoryName = categoryName;
    }

}
