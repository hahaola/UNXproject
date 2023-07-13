/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.ConfirmTokenServlet;

import DAO.ConfirmTokenDAO;
import DAO.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.ConfirmToken;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "ConfirmResetPassword", urlPatterns = {"/ConfirmResetPassword"})
public class ConfirmResetPassword extends HttpServlet {

    private ConfirmTokenDAO dao = new ConfirmTokenDAO();
    private LoginDAO loginDAO = new LoginDAO();
    private final static DateTimeFormatter CUSTOM_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");

        HttpSession session = request.getSession();
        session.setAttribute("acc", loginDAO.getInfoAccByID(dao.findByToken(token).getAccID()));

        int result = confirmToken(token);
        switch (result) {
            case 0:
                RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
                rd.forward(request, response);
                break;
            case 1:
                RequestDispatcher rd1 = request.getRequestDispatcher("ChangePassword.jsp");
                rd1.forward(request, response);
                break;
            case 2:
                request.setAttribute("notice", "Oops");
                request.setAttribute("alert", "Your Confirm Has Expired, Please Press Re-send The Link Confirm");
                request.setAttribute("link", "http://localhost:8080/FashionWeb/Re_ConfirmResetPassword?token=" + token);
                request.setAttribute("type", "Re-send Confirm");
                RequestDispatcher rd2 = request.getRequestDispatcher("Notice_Page.jsp");
                rd2.forward(request, response);
                break;
        }

    }

    private int confirmToken(String token) {
        ConfirmToken confirm = dao.findByToken(token);

        if (confirm.getConfirmAt() != null) {
            return 1; //Already confirm
        }
        LocalDateTime expired = LocalDateTime.parse(confirm.getExpireAt(), CUSTOM_FORMATTER);
        if (expired.isBefore(LocalDateTime.now())) {
            return 2; // Expired
        }

        dao.updateConfirmToken(token, LocalDateTime.now().format(CUSTOM_FORMATTER));
        return 0;
    }
}
