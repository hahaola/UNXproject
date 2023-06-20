 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.Login;

import DAO.LoginDAO;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Account;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";

        String user = request.getParameter("username");
        String pass = request.getParameter("pass");
        String remember = null;
        LoginDAO dao = new LoginDAO();

        Account result = dao.checkLogin(user, pass);
        System.out.println("USER VALID: " + result);

        if (result != null) {
            if (result.isIsStatus()) {
                if (result.getRoleID().equals("R01")) {

                    HttpSession session = request.getSession();
                    session.setAttribute("NAME", result);
                    if ((remember = request.getParameter("check")) != null) {
                        {
                            if (remember.equals("1")) {
                                
                                System.out.println(remember);
                                
                                Cookie cookieName = new Cookie("cookieName", user);
                                cookieName.setMaxAge(60*60);
                                Cookie cookiePass = new Cookie("cookiePass", pass);
                                cookieName.setMaxAge(60*60);
                                Cookie cookieRemember = new Cookie("remember", remember);
                                cookieName.setMaxAge(60*60);
                                response.addCookie(cookieName);
                                response.addCookie(cookiePass);
                                response.addCookie(cookieRemember);
                            }
                        }
                    }
                    url = "AdminHome";

                } else {
                    url = "HomeServlet";
                    HttpSession session = request.getSession();
                    session.setAttribute("NAME", result);
                    if ((remember = request.getParameter("check")) != null) {
                        {
                            if (remember.equals("1")) {
                                Cookie cookieName = new Cookie("cookieName", user);
                                cookieName.setMaxAge(60);
                                Cookie cookiePass = new Cookie("cookiePass", pass);
                                cookieName.setMaxAge(60);
                                Cookie cookieRemember = new Cookie("remember", remember);
                                cookieName.setMaxAge(60);
                                response.addCookie(cookieName);
                                response.addCookie(cookiePass);
                                response.addCookie(cookieRemember);
                            }
                        }

                    }

                }
            } else {
                url = "login.jsp";
                request.setAttribute("show", "show");
                request.setAttribute("alert", "danger");
                request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> THIS ACCOUNT STATUS IS NOT ACTIVE");
            }

        } else {
            url = "login.jsp";
            request.setAttribute("show", "show");
            request.setAttribute("alert", "danger");
            request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> LOGIN FAIL");
        }
        System.out.println("url " + url);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
