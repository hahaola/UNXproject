/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Admin;

import DAO.*;
import model.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import java.io.IOException;
import javax.servlet.http.*;
import java.util.List;
import javax.servlet.annotation.*;
import java.nio.file.Files;
import java.nio.file.Path;

@MultipartConfig
@WebServlet(name = "AdminAddNewProduct", urlPatterns = {"/AdminAddNewProduct"})
public class AdminAddNewProduct extends HttpServlet {

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

        String url = "";

        FashionDAO dao = new FashionDAO();
        List<Product> pl = dao.getAllProduct();
        List<category> cl = dao.getAllCategory();

        //add photo
        Part part = request.getPart("photo");
        String photoPath = request.getServletContext().getRealPath("/img");

        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Path.of(photoPath))) {
            Files.createDirectories(Path.of(photoPath));
        }
        part.write(photoPath + "/" + filename);

        //add name, price, category ID, rate
        String nameP = request.getParameter("nameP");
        double price = Double.parseDouble(request.getParameter("price"));
        String categoryID = request.getParameter("categoryID");

        float rating = Float.parseFloat(request.getParameter("rating"));

        System.out.println(autoIncreaseIDProduct(pl) + " - " +  filename + " - " + nameP + " - " + price + " - " + categoryID + " - " + rating);

        //---------------------------------------------------------------------------------------
        if (duplicationName(nameP, pl)) {
            request.setAttribute("show", "show");
            request.setAttribute("MESSAGE", "Product " + nameP + " is exist");
            url = "AdminAddNewProduct.jsp";
        } else {
            dao.newProduct(autoIncreaseIDProduct(pl), "img/" + filename, nameP, categoryID, price, true, rating);
            url = "AdminHome";
        }
        System.out.println("url: " + url);
        RequestDispatcher rd = request.getRequestDispatcher(url);
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

    boolean duplicationName(String name, List<Product> ls) {
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getNameP().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    String autoIncreaseIDProduct(List<Product> ls) {
        String id = "";
        int noId = 1;

        for (int i = 0; i < ls.size(); i++) {
            String[] str = ls.get(i).getPID().split("P");
            for (int j = 1; j < str.length; j++) {
                int no = Integer.parseInt(str[j]);
                while (noId <= no) {
                    noId++;
                }
            }
        }
        if (noId <= 9) {
            id = "P" + "000" + noId;

        } else if (noId <= 99) {
            id = "P" + "00" + noId;
        } else {
            id = "P" + "0" + noId;
        }
        return id;
    }

}
