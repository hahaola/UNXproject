package servlet.Admin;

import DAO.*;
import model.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.util.ArrayList;

@WebServlet(name = "AdminAddNewAccount", urlPatterns = {"/AdminAddNewAccount"})
public class AdminAddNewAccount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = "";

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        LoginDAO d = new LoginDAO();
        ArrayList<Account> ls = d.getAllAcc();

        if (duplicationName(username, ls)) {
            request.setAttribute("show", "show");
            request.setAttribute("MESSAGE", "Exist Username " + username);
            url = "AdminAddNewAccount.jsp";
        } else {
            System.out.println(autoIncreaseID(ls));
            d.NewAcc(autoIncreaseID(ls), username, password, fullname,email, "R01", true);
            System.out.println("ADD ACCOUNT: " + username + " - " + password + " - " + fullname + " - " + "R01");
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

    boolean duplicationName(String name, ArrayList<Account> ls) {
        for (int i = 0; i < ls.size(); i++) {
            if (ls.get(i).getUsername().equals(name)) {
                return true;
            }
        }
        return false;
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
}
