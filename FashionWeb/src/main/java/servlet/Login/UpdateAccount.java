/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Login;

import DAO.LoginDAO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import model.Account;

@WebServlet(name = "UpdateAccount", urlPatterns = {"/UpdateAccount"})
public class UpdateAccount extends HttpServlet {

    LoginDAO dao = new LoginDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("AID");

        Account al = dao.getInfoAccByID(id);
        System.out.println("acount update: " + al.toString());

        HttpSession session = request.getSession();
        session.setAttribute("u", al);
        request.getRequestDispatcher("UpdateAcc.jsp").
                forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "";

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("NAME");
        
//        System.out.println("after update: " + acc.getAccID() + " - " + user + " - " +  pass + " - " + name +" - " + acc.getRoleID());

        if (pass.equals(cpass)) {
            url = "HomeServlet";
            dao.updateAcc(acc.getAccID(), user, pass, name,email, acc.getRoleID(), true);
            Account a = dao.getInfoAccByID(acc.getAccID());
            session.setAttribute("NAME", a);
        } else {
            url = "UpdateAcc.jsp";
            request.setAttribute("show", "show");
            request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> Confirm Password is not match!");
        }

        request.getRequestDispatcher(url).
                forward(request, response);
    }

//    public boolean duplicateUsername(String user, ArrayList<Account> al) {
//        for (Account acc : al) {
//            if (acc.getUsername().equals(user)) {
//                return true;
//            }
//        }
//        return false;
//    }
}
