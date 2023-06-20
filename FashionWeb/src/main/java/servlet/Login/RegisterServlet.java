/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Login;

import DAO.LoginDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import model.Account;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = "";

        LoginDAO dao = new LoginDAO();
        ArrayList<Account> accl = dao.getAllAcc();

        String id = autoIncreaseID(accl);
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String passCheck = request.getParameter("pass1");
        String name = request.getParameter("name");
        System.out.println("New account: " + id + " - " + username + " - " + password + " - " + name + " - " + "R02");

        if (checkDuplicateUserName(username, accl)) {
            request.setAttribute("show", "show");
            request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> Username's exist");
            url = "login.jsp";
        } else {
            if (password.equals(passCheck)) {
                dao.NewAcc(id, username, password, name, "R02", true);
                url = "login.jsp";
            } else {
                request.setAttribute("show", "show");
                request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> RE-Enter Password is not match!");
                url = "login.jsp";

            }
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    String autoIncreaseID(ArrayList<Account> ls) {
        String id = "";
        int noId = 1;

        for (int i = 0; i < ls.size(); i++) {
            String[] str = ls.get(i).getAccID().split("A"); 
            for (int j = 1; j < str.length; j++) {
                int no = Integer.parseInt(str[j]);
                while (noId <= no) {
                    noId++;
                }
            }
        }
        if (noId <= 9) {
            id = "A" + "0" + noId;
        } else {
            id = "A" + noId;
        }
        return id;
    }

    boolean checkDuplicateUserName(String name, ArrayList<Account> ls) {
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getUsername().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }
}
