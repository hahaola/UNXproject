/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Admin;

import DAO.*;
import model.*;
import javax.servlet.ServletException;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.nio.file.Files;
import java.nio.file.Path;

@MultipartConfig
@WebServlet(name = "AdminUpdateProduct", urlPatterns = {"/AdminUpdateProduct"})
public class AdminUpdateProduct extends HttpServlet {

    int page = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        page = Integer.parseInt(request.getParameter("page"));
        System.out.println("current page product: " + page);

        String PID = request.getParameter("PID");
        FashionDAO dao = new FashionDAO();
        Product b = dao.getProduct(PID);
        request.setAttribute("p", b);

        System.out.println("Before: " + b.toString());

        request.getRequestDispatcher("AdminUpdateProduct.jsp").
                forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FashionDAO dao = new FashionDAO();
        System.out.println("current page product: " + page);

        String id = request.getParameter("id");
        String pName = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String categoryID = request.getParameter("cID");

        // Photo
        Part part = request.getPart("photo");
        String photoPath = request.getServletContext().getRealPath("/img");

        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Path.of(photoPath))) {
            Files.createDirectories(Path.of(photoPath));
        }
        part.write(photoPath + "/" + filename);

        System.out.println("after: " + id + " - " + pName + " - " + categoryID + " - " + price + " - " + filename);
        System.out.println("UPDATED");

        dao.updateProduct(id, "img/" + filename, pName, categoryID, price);
        request.getRequestDispatcher("AdminShowProduct?page=" + page).
                forward(request, response);
    }

}
