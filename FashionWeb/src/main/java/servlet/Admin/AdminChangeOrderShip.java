/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Admin;

import DAO.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "AdminChangeOrderShip", urlPatterns = {"/AdminChangeOrderShip"})
public class AdminChangeOrderShip extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("oid");
        boolean isShip = Boolean.parseBoolean(request.getParameter("isShip"));
        System.out.println(id + " - " + isShip);
        OrderDAO dao = new OrderDAO();
        dao.changeOrderDetail(isShip, id);
    }


}
