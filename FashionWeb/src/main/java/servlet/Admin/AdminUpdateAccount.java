package servlet.Admin;

import DAO.*;
import model.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.*;

@WebServlet(name = "AdminUpdateAccount", urlPatterns = {"/AdminUpdateAccount"})
public class AdminUpdateAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accID = request.getParameter("accID");
        System.out.println("ID update: " + accID);

        LoginDAO dao = new LoginDAO();
        Account acc = dao.getInfoAccByID(accID);
        ArrayList<Role> rl = dao.getAllRole();

        HttpSession session = request.getSession();
        session.setAttribute("u", acc);

        for (Role r : rl) {
            if (acc.getRoleID().equals(r.getRID())) {
                session.setAttribute("role", r.getRname());
            }
        }

        System.out.println("Before: " + acc);

        request.getRequestDispatcher("AdminUpdateAccount.jsp").
                forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("u");

        LoginDAO dao = new LoginDAO();
        ArrayList<Role> rl = dao.getAllRole();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        String role = request.getParameter("role");
        String roleID = "";
        for (Role r : rl) {
            if (role.equals(r.getRname())) {
                roleID = r.getRID();
            }
        }

        boolean status = Boolean.parseBoolean(request.getParameter("status"));

        System.out.println("Update: " + acc.getAccID() + " - " + username + " - " + password + " - " + fullname + " - " + roleID + " - " + status);
        System.out.println("HAS UPDATED");

        dao.updateAcc(acc.getAccID(), username, password, fullname,email, roleID, true);

        request.getRequestDispatcher("AdminHome").forward(request, response);
    }

}
