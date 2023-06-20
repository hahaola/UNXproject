/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

import model.*;

import java.io.IOException;
import java.util.logging.Filter;
import java.util.logging.LogRecord;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter implements Filter {

    private ServletContext context;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String url = request.getRequestURI();
        Cookie[] cookies = request.getCookies();
        HttpSession session = request.getSession();
        Account acc = null;
        if (url.startsWith("/DemoAssignment/Admin")) {
            if (((acc = (Account) session.getAttribute("NAME")) != null)) {
                System.out.println("cookies is not null " + (cookies != null));
                System.out.println("Acc in filter: " + acc);
                if (acc.getRoleID().equals("R01")) {
                    System.out.println("PERMISSION");
                    fc.doFilter(req, res);
                } else if (acc.getRoleID().equals("R02")) {

                    request.setAttribute("color", "#f44336");
                    request.setAttribute("message", "<div class=\"alert\">\n"
                            + "  <span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\">&times;</span> \n"
                            + "  YOU DON'T HAVE PERMISSION TO ACCESS\n"
                            + "</div>");
                    System.out.println("NOT PERMISSION");
                    RequestDispatcher rd = request.getRequestDispatcher("HomeServlet");
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("show", "show");
                request.setAttribute("alert", "danger");
                request.setAttribute("ERROR", "<span><i class=\"bi bi-exclamation-triangle-fill\"></i></span> LOGIN FIRST");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } else {
            fc.doFilter(req, res);
        }

    }

    public void destroy() {

    }

    @Override
    public boolean isLoggable(LogRecord record) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
